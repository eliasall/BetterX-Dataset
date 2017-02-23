SELECT count(*) FROM betterX.file_log; #1020
select count(*) from web_entries; #51515
select count(*) from web_pages; #2428
#done

##############################################################################################################################
## user overview
##############################################################################################################################
SELECT betterX.setup.* , date(from_unixtime( cast(cast(betterX.setup.`timestamp` as char(10)) as unsigned) )) as `date`, 
manufacturer, model, betterX.features.version, screen_height, screen_width, a.tickets_total, b.files_total, 
ba.created,  concat(left(ba.gcm_regid,3),'...',right(ba.gcm_regid,3)) as regid,
betterX.web_info.browser, c.daily_zipFile_cnt, c.first, c.latest, d.web_page_count, e.total_metric_measurements,
f.hitSubmitted, f.answer1, f.answer2, f.answer3
FROM betterX.setup
left join betterX.features on betterX.features.uid = betterX.setup.uid
left join 	(
				SELECT 
				uid, sum(tickets) as tickets_total
				FROM betterX.tickets
				group by uid
			) as a on a.uid = betterX.setup.uid
left join 	(
				SELECT 
				file_uid, count(*) as files_total
				FROM betterX.file_log
				group by file_uid
			) as b on b.file_uid = betterX.setup.uid
left join 
			(
            select concat(imei, meid, simserial, androidid) as uid, max(created) as created, gcm_regid
			from gcm_users
			group by imei, meid, simserial, androidid
            ) as ba on ba.uid = betterX.setup.uid
left join betterX.web_info on betterX.web_info.uid = betterX.setup.uid
left join (
				select file_uid, count(*) as daily_zipFile_cnt, min(date) as first, max(date) as latest
				from 	(
							SELECT file_uid, date(concat(right(file_time,4), '-', mid(file_time,3,2), '-', left(file_time,2))) as date
							FROM betterX.file_log
							group by file_uid, date(concat(right(file_time,4), '-', mid(file_time,3,2), '-', left(file_time,2)))
						) as a
				group by file_uid
			) as c on c.file_uid = betterX.setup.uid
left join (
				select uid, count(*) as web_page_count
				from betterX.web_pages
                group by uid
		) as d on d.uid =  betterX.setup.uid
left join (
				select uid, sum(cnt) as total_metric_measurements
				from betterX.daily_data_counts_per_uid
                group by uid
			) as e on e.uid = betterX.setup.uid
left join (
				select SubmitTime as hitSubmitted,  trim(`Answer.Q1DevicdeId`) as answer1, 
                trim(`Answer.Q2FirefoxAddonName`) as answer2, trim(`Answer.Q3FirefoxAddonName`) as answer3
                from betterX.mTurk
		) as f on left(betterX.setup.uid, length(trim(f.answer1))) = trim(f.answer1);
##############################################################################################################################


## daily data counts per uid
##############################################################################################################################
SELECT * FROM betterX.daily_data_counts_per_uid;
##############################################################################################################################

## mTurk Report
##############################################################################################################################
SELECT trim(`Answer.Q1DevicdeId`) as uid, SubmitTime as hitSubmitted, x.daily_zipFile_cnt, x.first, x.latest
FROM betterX.mTurk
left join 
(
 
select file_uid, count(*) as daily_zipFile_cnt, min(date) as first, max(date) as latest
from 	(
			SELECT file_uid, date(concat(right(file_time,4), '-', mid(file_time,3,2), '-', left(file_time,2))) as date
			FROM betterX.file_log
			group by file_uid, date(concat(right(file_time,4), '-', mid(file_time,3,2), '-', left(file_time,2)))
		) as a
group by file_uid

) as x on left(x.file_uid, length(trim(`Answer.Q1DevicdeId`))) = trim(`Answer.Q1DevicdeId`);
##############################################################################################################################



######################
## domain usage report
######################
SELECT a.domain, a.title, a.category1, count(*) as cntSessions, count(distinct(a.uid)) as cntUids, b.cntDays
FROM betterX._user_webSessions as a
left join 
(
	SELECT domain, title, category1, count(distinct(dayofyear((from_unixtime( UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(`pageStartTime` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))))))) as `cntDays`
	FROM betterX._user_webSessions
    left join betterX.setup on betterX.setup.uid = betterX._user_webSessions.uid 
	left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
	group by domain, title, category1
) as b on b.domain = a.domain
group by a.domain, a.title, a.category1
order by count(*) desc , count(distinct(a.uid)) desc
limit 9999999999;

##########################
## uid-domain usage report
##########################
select _user_webSessions.uid, betterX._user_webSessions.domain, count(*) as cntSessions,  count(distinct(dayofyear((from_unixtime( UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(`pageStartTime` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))))))) as `cntDays`,
x.cntSessions as cntSessionsAll, x.cntUids as cntUIDsAll, x.cntDays as cntDaysAll
FROM betterX._user_webSessions
left  join 
(
SELECT a.domain, a.title, a.category1, count(*) as cntSessions, count(distinct(a.uid)) as cntUids, b.cntDays
FROM betterX._user_webSessions as a
left join 
(
	SELECT domain, title, category1, count(distinct(dayofyear((from_unixtime( cast(cast(`pageStartTime` as char(10)) as unsigned) ))))) as `cntDays`
	FROM betterX._user_webSessions
	group by domain, title, category1
) as b on b.domain = a.domain
group by a.domain, a.title, a.category1
) as x on x.domain = betterX._user_webSessions.domain
left join betterX.setup on betterX.setup.uid = betterX._user_webSessions.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
group by  uid, betterX._user_webSessions.domain
order by count(*) desc
limit 999999999;

###########################
## domain - location report
###########################
SELECT domain, category1, location_address, count(*) as cntSessions, count(distinct(uid)) as cntUsers
FROM betterX._user_webSessions
group by domain, category1, location_address
order by count(*) desc, count(distinct(uid)) desc
limit 99999999999999999;

####################################
## user - domain - location report
####################################
SELECT uid, domain, category1, location_address, count(*) as cntSessions
FROM betterX._user_webSessions
group by uid, domain, category1, location_address
order by count(*) desc, uid asc
limit 99999999999999999;

####################################
## domain - duration report
####################################
SELECT domain, category1, count(*) as cntSessions, min(estimateDuration) as minEstDuration,
max(estimateDuration) as maxEstDuration, avg(estimateDuration) as avgEstDuration
FROM betterX._user_webSessions
group by domain, category1
limit 99999999999999999;

####################################
## user - domain - duration report
####################################
SELECT uid, domain, category1, count(*) as cntSessions, min(estimateDuration) as minEstDuration,
max(estimateDuration) as maxEstDuration, avg(estimateDuration) as avgEstDuration
FROM betterX._user_webSessions
group by uid, domain, category1
limit 99999999999999999;

###################################
## user daily report (ALL)
###################################
SELECT * 
FROM betterX._user_webSessions 
limit 99999999999999999;

SELECT betterX._user_locations.uid, betterX._user_locations.timestmp,
betterX._user_locations.latitude, betterX._user_locations.longitude,
betterX._user_locations.accuracy, betterX._user_geolocations.address, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX._user_locations.unxTm as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `userTimevalue`,
CONVERT_TZ(from_unixtime( cast(cast(betterX._user_locations.unxTm as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr) as `userTimestamp`
FROM betterX._user_locations
join betterX._user_geolocations on betterX._user_geolocations.Latitude = betterX._user_locations.latitude
and betterX._user_geolocations.Longitude = betterX._user_locations.longitude
left join betterX.setup on betterX.setup.uid = betterX._user_locations.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
group by betterX._user_locations.uid, betterX._user_locations.timestmp,
betterX._user_locations.latitude, betterX._user_locations.longitude,
betterX._user_locations.accuracy, betterX._user_geolocations.address, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX._user_locations.unxTm as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)),
CONVERT_TZ(from_unixtime( cast(cast(betterX._user_locations.unxTm as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)
order by betterX._user_locations.timestmp asc 
limit 99999999999999999;

select *, 
CONVERT_TZ(timestmp, 'UTC', betterX._user_timeZones.tzone_abbr) as `userTimestamp`
from _user_readings 
left join betterX.setup on betterX.setup.uid = betterX._user_readings.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
order by _user_readings.uid asc, timestmp asc limit 99999999999999999;

###################################
## user daily report (each)
###################################
SELECT 
betterX._user_webSessions.uid as uid, 
dayofyear(CONVERT_TZ(from_unixtime( cast(cast(`pageStartTime` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `dayOfYear`, count(*) as cnt
FROM betterX._user_webSessions
left join betterX.setup on betterX.setup.uid = betterX._user_webSessions.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
group by betterX._user_webSessions.uid, dayofyear(CONVERT_TZ(from_unixtime( cast(cast(`pageStartTime` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by count(*) desc
limit 9999999999999;

set @userid = '<SETHERE>' collate utf8_unicode_ci ;
set @userday = 41;

SELECT betterX._user_webSessions.userTimestamp as `timestamp`, a.latitude as lat, a.longitude as lon,
replace(
	CONCAT(
		'<strong>', betterX._user_webSessions.location_address, '</strong>', '<br/>', 'Accuracy:', cast(a.accuracy as char(10)), 
		'<br/>', 'LocationSessions: ' , cast(b.CntLocationSessions as char(10)),
		'<br/>', 'TodaysLocationSessions: ', cast(c.CntTodaysLocationSessions as char(10)),
		'<br/>', 'LocationDomains: ', cast(b.CntLocationDomains as char(10)), 
		'<br/>', 'TodaysLocationDomains: ', cast(c.CntTodaysLocationDomains as char(10)),
		'<br/>', 'LocationDomainList: ', cast(b.LocationDomainsList as char(250)),
        '<br/>', 'TodaysLocationDomainList: ', cast(c.TodaysLocationDomainsList as char(250))
        ) collate utf8_unicode_ci
	,
	',', '|') collate utf8_unicode_ci as `desc` 
FROM betterX._user_webSessions 
left join
	(
		select _user_geolocations.address, min(_user_locations.accuracy) as accuracy, max(_user_geolocations.latitude) as latitude, max(_user_geolocations.longitude) as longitude
        from _user_geolocations
        left join _user_locations on _user_locations.latitude = _user_geolocations.latitude and _user_locations.longitude = _user_geolocations.longitude
        where _user_geolocations.address is not null and _user_geolocations.latitude is not null and _user_geolocations.longitude is not null
        group by address
    ) as a on a.address = betterX._user_webSessions.location_address
left join 
	(
    select uid, location_address, count(*) as CntLocationSessions, count(distinct(domain)) as CntLocationDomains, GROUP_CONCAT(distinct(domain)) as LocationDomainsList
	from betterX._user_webSessions
	where location_address is not null
	group by uid, location_address
	order by uid, location_address
    ) as b on b.uid = betterX._user_webSessions.uid and b.location_address = betterX._user_webSessions.location_address
left join
	(
	select uid, dayofyear(betterX._user_webSessions.userTime) as `day`, location_address, count(*) as CntTodaysLocationSessions, count(distinct(domain)) as CntTodaysLocationDomains, GROUP_CONCAT(distinct(domain)) as TodaysLocationDomainsList
	from betterX._user_webSessions
	where location_address is not null and betterX._user_webSessions.userTime is not null
	group by uid, dayofyear(betterX._user_webSessions.userTime), location_address
	order by uid, dayofyear(betterX._user_webSessions.userTime), location_address
    ) as c on c.uid = betterX._user_webSessions.uid and c.location_address = betterX._user_webSessions.location_address and c.`day` = dayofyear(betterX._user_webSessions.userTime)
where betterX._user_webSessions.uid = @userid
and dayofyear(betterX._user_webSessions.userTime) = @userday 
and betterX._user_webSessions.location_address is not null and a.latitude is not null and a.longitude is not null
group by `timestamp`, lat, lon, `desc`
order by betterX._user_webSessions.userTimestamp asc;

## apps
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.apps.`timestamp` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(distinct(app)), ',', '|') as `value`
FROM betterX.apps
left join betterX.setup on betterX.setup.uid = betterX.apps.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.apps.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.apps.`timestamp` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.apps.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.apps.`timestamp` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.apps.`timestamp` asc;

## battery_level
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_battery.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
MIN(`level`) as `value`
FROM betterX.sensor_battery
left join betterX.setup on betterX.setup.uid = betterX.sensor_battery.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.sensor_battery.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_battery.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.sensor_battery.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_battery.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.sensor_battery.`epoch` asc;

## battery_temp
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_battery.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
MIN(`temp`) as `value`
FROM betterX.sensor_battery
left join betterX.setup on betterX.setup.uid = betterX.sensor_battery.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.sensor_battery.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_battery.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.sensor_battery.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_battery.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.sensor_battery.`epoch` asc;

## connection_connected
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
cast(MIN(`connected`) as unsigned) as `value`
FROM betterX.sensor_connection
left join betterX.setup on betterX.setup.uid = betterX.sensor_connection.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.sensor_connection.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.sensor_connection.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.sensor_connection.`epoch` asc;

## connection_connecting
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
cast(MIN(`connecting`) as unsigned) as `value`
FROM betterX.sensor_connection
left join betterX.setup on betterX.setup.uid = betterX.sensor_connection.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.sensor_connection.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.sensor_connection.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.sensor_connection.`epoch` asc;

## connection_available
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
cast(MIN(`available`) as unsigned) as `value`
FROM betterX.sensor_connection
left join betterX.setup on betterX.setup.uid = betterX.sensor_connection.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.sensor_connection.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.sensor_connection.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.sensor_connection.`epoch` asc;

## connection_networkType
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(DISTINCT(`networkType`)), ',', '|') as `value`
FROM betterX.sensor_connection
left join betterX.setup on betterX.setup.uid = betterX.sensor_connection.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.sensor_connection.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.sensor_connection.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.sensor_connection.`epoch` asc;

## connection_roaming
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(DISTINCT(`roaming`)), ',', '|') as `value`
FROM betterX.sensor_connection
left join betterX.setup on betterX.setup.uid = betterX.sensor_connection.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.sensor_connection.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.sensor_connection.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connection.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.sensor_connection.`epoch` asc;

## connection_strength
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connectionStrength.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
MIN(`strength`) as `value`
FROM betterX.sensor_connectionStrength
left join betterX.setup on betterX.setup.uid = betterX.sensor_connectionStrength.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.sensor_connectionStrength.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connectionStrength.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.sensor_connectionStrength.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_connectionStrength.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.sensor_connectionStrength.`epoch` asc;

## network_ssid
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(DISTINCT(`ssid`)), ',', '|') as `value`
FROM betterX.network
left join betterX.setup on betterX.setup.uid = betterX.network.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.network.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.network.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.network.`epoch` asc;

## network_state
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(DISTINCT(`detailedState`)), ',', '|') as `value`
FROM betterX.network
left join betterX.setup on betterX.setup.uid = betterX.network.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.network.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.network.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.network.`epoch` asc;

## network_internet
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(DISTINCT(`hasInternet`)), ',', '|') as `value`
FROM betterX.network
left join betterX.setup on betterX.setup.uid = betterX.network.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.network.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.network.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.network.`epoch` asc;

## network_linkSpeed
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
MIN(`linkSpeed`) as `value`
FROM betterX.network
left join betterX.setup on betterX.setup.uid = betterX.network.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.network.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.network.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.network.`epoch` asc;

## network_mobile
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(DISTINCT(`mobileStatus`)), ',', '|') as `value`
FROM betterX.network
left join betterX.setup on betterX.setup.uid = betterX.network.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.network.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.network.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.network.`epoch` asc;

## network_signalStrength
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
MIN(`signalStrength`) as `value`
FROM betterX.network
left join betterX.setup on betterX.setup.uid = betterX.network.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.network.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.network.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.network.`epoch` asc;

## network_wifi
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(DISTINCT(`wifiStatus`)), ',', '|') as `value`
FROM betterX.network
left join betterX.setup on betterX.setup.uid = betterX.network.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.network.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.network.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.network.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.network.`epoch` asc;


## phoneState
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_phoneState.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(DISTINCT(
trim(CONCAT(
if (left(`data`, 10) = 'CALL_STATE', trim(`data`), ''),
if (left(`data`, 13) = 'DATA_ACTIVITY', trim(`data`), ''),
if (left(`data`, 14) = 'DATA_CONNECTED', trim(`data`), ''),
if (left(`data`, 17) = 'DATA_DISCONNECTED', trim(`data`), ''),
if (left(`data`, 14) = 'DATA_SUSPENDED', trim(`data`), ''),
if (left(`data`, 20) = 'STATE_EMERGENCY_ONLY', trim(left(`data`, locate(' ', `data`))), ''),
if (left(`data`, 16) = 'STATE_IN_SERVICE', trim(left(`data`, locate(' ', `data`))), ''),
if (left(`data`, 20) = 'STATE_OUT_OF_SERVICE', trim(left(`data`, locate(' ', `data`))), ''),
if (left(`data`, 15) = 'STATE_POWER_OFF', trim(left(`data`, locate(' ', `data`))), '')
)) COLLATE utf8_unicode_ci)), ',' , '|') as `value`
FROM betterX.sensor_phoneState
left join betterX.setup on betterX.setup.uid = betterX.sensor_phoneState.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.sensor_phoneState.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_phoneState.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.sensor_phoneState.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_phoneState.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.sensor_phoneState.`epoch` asc;

## phoneScreen
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_screen.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(DISTINCT(`status`)), ',', '|') as `value`
FROM betterX.sensor_screen
left join betterX.setup on betterX.setup.uid = betterX.sensor_screen.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.sensor_screen.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_screen.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.sensor_screen.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_screen.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.sensor_screen.`epoch` asc;

## steps
select
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_stepCounter.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
MAX(stepCount) as `value`
FROM betterX.sensor_stepCounter
left join betterX.setup on betterX.setup.uid = betterX.sensor_stepCounter.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
where betterX.sensor_stepCounter.uid = @userid 
and dayofyear(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_stepCounter.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) = @userday
group by betterX.sensor_stepCounter.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.sensor_stepCounter.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.sensor_stepCounter.`epoch` asc;

#########################################################
## cleanup
#########################################################
update betterX.setup set country = 'Cyprus' where country = 'cyprua';
update betterX.setup set country = 'Cyprus' where country = 'Κύπρος';
update betterX.setup set country = 'United States' where country = 'usa';
update betterX.setup set country = trim(Country);
update betterX.setup set country = upper(Country);
select distinct(country) from betterX.setup;
select uid, count(*) from betterX.setup group by uid having count(*) > 1; #ok!



#########################################################
## Add domain type to webSessions
#########################################################
ALTER TABLE `betterX`.`_user_webSessions` 
ADD COLUMN `domain_type` VARCHAR(45) NULL DEFAULT NULL COMMENT '' AFTER `location_type`;

update _user_webSessions set domain_type='Online Ads Distributor' where domain='amazon-adsystem.com';
update _user_webSessions set domain_type='Online Ads Distributor' where domain='mb103.com';
update _user_webSessions set domain_type='Online Ads Distributor' where domain='moz.com';
update _user_webSessions set domain_type='File/Video/Photo Sharing' where domain='eroshare.com';
update _user_webSessions set domain_type='Apps Site' where domain='taskbucksmailer.com';
update _user_webSessions set domain_type='Apps Site' where domain='appypie.com';
update _user_webSessions set domain_type='Apps Site' where domain='appsgeyser.com';
update _user_webSessions set domain_type='Apps Site' where domain='helloenglishapp.com';
update _user_webSessions set domain_type='Apps Site' where domain='polarisoffice.com';
update _user_webSessions set domain_type='Brand Site' where domain='camel.com';
update _user_webSessions set domain_type='Brand Site' where domain='marlboro.com';
update _user_webSessions set domain_type='Brand Site' where domain='freedom251.com';
update _user_webSessions set domain_type='Brand Site' where domain='justinlovato.com';
update _user_webSessions set domain_type='Brand Site' where domain='iwillteachyoutoberich.com';
update _user_webSessions set domain_type='Brand Site' where domain='transferwise.com';
update _user_webSessions set domain_type='Classifieds' where domain='groupon.com';
update _user_webSessions set domain_type='Consumer Electronics' where domain='gsmarena.com';
update _user_webSessions set domain_type='Croudsourcing / Freelancing Site' where domain='mturk.com';
update _user_webSessions set domain_type='Croudsourcing / Freelancing Site' where domain='microworkers.com';
update _user_webSessions set domain_type='Croudsourcing / Freelancing Site' where domain='minijobz.com';
update _user_webSessions set domain_type='Croudsourcing / Freelancing Site' where domain='truelancer.com';
update _user_webSessions set domain_type='Digital Library' where domain='archive.org';
update _user_webSessions set domain_type='Digital Library' where domain='wikipedia.org';
update _user_webSessions set domain_type='Digital Library' where domain='mayoclinic.org';
update _user_webSessions set domain_type='Entertainment Site' where domain='go.com';
update _user_webSessions set domain_type='Entertainment Site' where domain='meaww.com';
update _user_webSessions set domain_type='Entertainment Site' where domain='netflix.com';
update _user_webSessions set domain_type='Entertainment Site' where domain='kcineplex.com';
update _user_webSessions set domain_type='Entertainment Site' where domain='ucweb.com';
update _user_webSessions set domain_type='Entertainment Site' where domain='rosebudcinema.com';
update _user_webSessions set domain_type='Entertainment Site' where domain='googlevideo.com';
update _user_webSessions set domain_type='Entertainment Site' where domain='thechive.com';
update _user_webSessions set domain_type='Entertainment Site' where domain='youtu.be';
update _user_webSessions set domain_type='Entertainment Site' where domain='achaea.com';
update _user_webSessions set domain_type='Entertainment Site' where domain='imdb.com';
update _user_webSessions set domain_type='File/Video/Photo Sharing' where domain='fileconvoy.com';
update _user_webSessions set domain_type='File/Video/Photo Sharing' where domain='tinypic.com';
update _user_webSessions set domain_type='File/Video/Photo Sharing' where domain='imgur.com';
update _user_webSessions set domain_type='Food Site' where domain='allrecipes.com';
update _user_webSessions set domain_type='Food Site' where domain='postmates.com';
update _user_webSessions set domain_type='Food Site' where domain='foodnetwork.com';
update _user_webSessions set domain_type='Food Site' where domain='montparnasse-restaurant.com';
update _user_webSessions set domain_type='Food Site' where domain='dominos.co.in';
update _user_webSessions set domain_type='Internet Gateway' where domain='wapspot.mobi';
update _user_webSessions set domain_type='Internet Gateway' where domain='network-auth.com';
update _user_webSessions set domain_type='Internet Gateway' where domain='3bbwifi.com';
update _user_webSessions set domain_type='News Site' where domain='kathimerini.com.cy';
update _user_webSessions set domain_type='News Site' where domain='grid.mk';
update _user_webSessions set domain_type='News Site' where domain='nytimes.com';
update _user_webSessions set domain_type='News Site' where domain='thestate.com';
update _user_webSessions set domain_type='News Site' where domain='sigmalive.com';
update _user_webSessions set domain_type='News Site' where domain='politis-news.com';
update _user_webSessions set domain_type='News Site' where domain='philenews.com';
update _user_webSessions set domain_type='News Site' where domain='telegraf.mk';
update _user_webSessions set domain_type='News Site' where domain='pastemagazine.com';
update _user_webSessions set domain_type='News Site' where domain='tmz.com';
update _user_webSessions set domain_type='News Site' where domain='annistonstar.com';
update _user_webSessions set domain_type='News Site' where domain='msnbc.com';
update _user_webSessions set domain_type='News Site' where domain='suddenlink.net';
update _user_webSessions set domain_type='News Site' where domain='msn.com';
update _user_webSessions set domain_type='News Site' where domain='lider.mk';
update _user_webSessions set domain_type='News Site' where domain='bostonglobe.com';
update _user_webSessions set domain_type='News Site' where domain='kurir.mk';
update _user_webSessions set domain_type='News Site' where domain='indiatimes.com';
update _user_webSessions set domain_type='News Site' where domain='boreburn.com';
update _user_webSessions set domain_type='News Site' where domain='reddit.com';
update _user_webSessions set domain_type='News Site' where domain='afternoonspecial.com';
update _user_webSessions set domain_type='News Site' where domain='ilyke.co';
update _user_webSessions set domain_type='News Site' where domain='predictwallstreet.com';
update _user_webSessions set domain_type='News Site' where domain='rivals.com';
update _user_webSessions set domain_type='News Site' where domain='rezultati.com';
update _user_webSessions set domain_type='News Site' where domain='sportlife.com.mk';
update _user_webSessions set domain_type='Online Portal' where domain='blogspot.com';
update _user_webSessions set domain_type='Online Portal' where domain='wikihow.com';
update _user_webSessions set domain_type='Online Store' where domain='amazon.com';
update _user_webSessions set domain_type='Online Store' where domain='bigbasket.com';
update _user_webSessions set domain_type='Online Store' where domain='mymorestore.com';
update _user_webSessions set domain_type='Online Store' where domain='amazon.in';
update _user_webSessions set domain_type='Online Store' where domain='ebay.in';
update _user_webSessions set domain_type='Online Store' where domain='whaaky.com';
update _user_webSessions set domain_type='Online Store' where domain='mvmtwatches.com';
update _user_webSessions set domain_type='Online Store' where domain='1800flowers.com';
update _user_webSessions set domain_type='Online Store' where domain='aliexpress.com';
update _user_webSessions set domain_type='Online Store' where domain='woot.com';
update _user_webSessions set domain_type='Online Store' where domain='wish.com';
update _user_webSessions set domain_type='Online Store' where domain='labdepotinc.com';
update _user_webSessions set domain_type='Online Store' where domain='livenation.com';
update _user_webSessions set domain_type='Organization Site' where domain='progressive.com';
update _user_webSessions set domain_type='Organization Site' where domain='mozilla.org';
update _user_webSessions set domain_type='Organization Site' where domain='fraziersonfuneralhome.com';
update _user_webSessions set domain_type='Organization Site' where domain='kaust.edu.sa';
update _user_webSessions set domain_type='Organization Site' where domain='cint.com';
update _user_webSessions set domain_type='Organization Site' where domain='uab.edu';
update _user_webSessions set domain_type='Organization Site' where domain='capitalone.com';
update _user_webSessions set domain_type='Organization Site' where domain='canadavisa.com';
update _user_webSessions set domain_type='Organization Site' where domain='bluedart.com';
update _user_webSessions set domain_type='Organization Site' where domain='tnt.com';
update _user_webSessions set domain_type='Organization Site' where domain='madisonstreetcapital.com';
update _user_webSessions set domain_type='Organization Site' where domain='ieltstestonline.com';
update _user_webSessions set domain_type='Organization Site' where domain='betterx.org';
update _user_webSessions set domain_type='Organization Site' where domain='mozilla.net';
update _user_webSessions set domain_type='Organization Site' where domain='cytanet.com.cy';
update _user_webSessions set domain_type='Uknown / Other' where domain='voynich.nu';
update _user_webSessions set domain_type='Uknown / Other' where domain='zendesk.com';
update _user_webSessions set domain_type='Personal Site' where domain='aliciapharis.com';
update _user_webSessions set domain_type='Personal Site' where domain='baumerdesigns.com';
update _user_webSessions set domain_type='Personal Site' where domain='ralphsteadmanprints.com';
update _user_webSessions set domain_type='Realestate Site' where domain='foreclosure.com';
update _user_webSessions set domain_type='Realestate Site' where domain='realtytrac.com';
update _user_webSessions set domain_type='Realestate Site' where domain='mls.com';
update _user_webSessions set domain_type='Realestate Site' where domain='foreclosurelistings.com';
update _user_webSessions set domain_type='Realestate Site' where domain='habitatlive.com';
update _user_webSessions set domain_type='Rewards Site' where domain='virtualrewardcenter.com';
update _user_webSessions set domain_type='Search Engine' where domain='google.com';
update _user_webSessions set domain_type='Search Engine' where domain='google.co.in';
update _user_webSessions set domain_type='Search Engine' where domain='yahoo.com';
update _user_webSessions set domain_type='Search Engine' where domain='goo.gl';
update _user_webSessions set domain_type='Search Engine' where domain='bing.com';
update _user_webSessions set domain_type='Social Media' where domain='facebook.com';
update _user_webSessions set domain_type='Social Media' where domain='fbcdn.net';
update _user_webSessions set domain_type='Social Media' where domain='fb.com';
update _user_webSessions set domain_type='Social Media' where domain='twitter.com';
update _user_webSessions set domain_type='Surveys' where domain='qualtrics.com';
update _user_webSessions set domain_type='Surveys' where domain='soscisurvey.de';
update _user_webSessions set domain_type='Surveys' where domain='questionpro.com';
update _user_webSessions set domain_type='Surveys' where domain='surveymonkey.com';
update _user_webSessions set domain_type='Surveys' where domain='mob4hire.com';
update _user_webSessions set domain_type='Surveys' where domain='surveygizmo.com';
update _user_webSessions set domain_type='Surveys' where domain='prolific.ac';
update _user_webSessions set domain_type='Surveys' where domain='surveysavvy.com';
update _user_webSessions set domain_type='Surveys' where domain='unipark.de';
update _user_webSessions set domain_type='Surveys' where domain='surveyrouter.com';
update _user_webSessions set domain_type='Surveys' where domain='millisecond.com';
update _user_webSessions set domain_type='Surveys' where domain='arcticshores.com';
update _user_webSessions set domain_type='Surveys' where domain='utest.com';
update _user_webSessions set domain_type='Surveys' where domain='tolunaquick.com';
update _user_webSessions set domain_type='Uknown / Other' where domain='userstyles.org';
update _user_webSessions set domain_type='Travel Site' where domain='booking.com';
update _user_webSessions set domain_type='Travel Site' where domain='pamediakopes.gr';
update _user_webSessions set domain_type='Travel Site' where domain='topkinisis.com';
update _user_webSessions set domain_type='Travel Site' where domain='taxidiamprosta.com';
update _user_webSessions set domain_type='Travel Site' where domain='sierraattahoe.com';
update _user_webSessions set domain_type='Travel Site' where domain='tripadvisor.com';
update _user_webSessions set domain_type='Travel Site' where domain='inntopia.travel';
update _user_webSessions set domain_type='Travel Site' where domain='infotours.com.mk';
update _user_webSessions set domain_type='Uknown / Other' where domain='coinbase.com';
update _user_webSessions set domain_type='Uknown / Other' where domain='panagiamegalohari.gr';
update _user_webSessions set domain_type='Uknown / Other' where domain='guitar-chords.org.uk';
update _user_webSessions set domain_type='Uknown / Other' where domain='davx.us';
update _user_webSessions set domain_type='Uknown / Other' where domain='ftcjftsodg.pw';
update _user_webSessions set domain_type='Uknown / Other' where domain='omniwebtickets.com';
update _user_webSessions set domain_type='Uknown / Other' where domain='vbs.cm';
update _user_webSessions set domain_type='Uknown / Other' where domain='linksredirect.com';
update _user_webSessions set domain_type='Uknown / Other' where domain='googleadservices.com';
update _user_webSessions set domain_type='Uknown / Other' where domain='whats.';
update _user_webSessions set domain_type='Uknown / Other' where domain='reddit.';
update _user_webSessions set domain_type='Uknown / Other' where domain='zeroredirect1.com';
update _user_webSessions set domain_type='Uknown / Other' where domain='209.236.68.39.';
update _user_webSessions set domain_type='Uknown / Other' where domain='192.168.1.104.';
update _user_webSessions set domain_type='URL Shortner' where domain='bit.ly';
update _user_webSessions set domain_type='URL Shortner' where domain='tinyurl.com';
update _user_webSessions set domain_type='Weather Site' where domain='accuweather.com';
update _user_webSessions set domain_type='Weather Site' where domain='weather.com';
update _user_webSessions set domain_type='Web Hosting' where domain='weebly.com';
update _user_webSessions set domain_type='Web Portal' where domain='ighome.com';

#########################################################
## Append All Remaining Metrics to WebSessions
#########################################################

create table _metrics_app as
select
betterX.apps.uid,
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.apps.`timestamp` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(distinct(app)), ',', '|') as `value`
FROM betterX.apps
left join betterX.setup on betterX.setup.uid = betterX.apps.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
group by betterX.apps.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(betterX.apps.`timestamp` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr))
order by  betterX.apps.uid, betterX.apps.`timestamp` asc;
ALTER TABLE `betterX`.`_metrics_app` 
ADD INDEX `index1` (`uid` ASC)  COMMENT '',
ADD INDEX `index2` (`timestamp` ASC)  COMMENT '';

create table _metrics_battery as
select
a.uid,
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
a.`status`,  a.`level` as `value`, a.`temp`
FROM betterX.sensor_battery as a
left join betterX.setup on betterX.setup.uid = a.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
group by a.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)),
a.`status`,  a.`level`, a.`temp`;

ALTER TABLE `betterX`.`_metrics_battery` 
ADD INDEX `index1` (`uid` ASC)  COMMENT '',
ADD INDEX `index2` (`timestamp` ASC)  COMMENT '';


create table _metrics_connection as
select
a.uid,
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
a.`networkType` as `type`,  a.`roaming`, a.ssid, a.connected, a.connecting, a.available
FROM betterX.sensor_connection as a
left join betterX.setup on betterX.setup.uid = a.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
group by a.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)),
a.`networkType`,  a.`roaming`, a.ssid, a.connected, a.connecting, a.available;

ALTER TABLE `betterX`.`_metrics_connection` 
ADD INDEX `index1` (`uid` ASC)  COMMENT '',
ADD INDEX `index2` (`timestamp` ASC)  COMMENT '';

create table _metrics_connectionStrength as
select
a.uid,
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
a.strength
FROM betterX.sensor_connectionStrength as a
left join betterX.setup on betterX.setup.uid = a.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
group by a.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)),
a.strength;

ALTER TABLE `betterX`.`_metrics_connectionStrength` 
ADD INDEX `index1` (`uid` ASC)  COMMENT '',
ADD INDEX `index2` (`timestamp` ASC)  COMMENT '';

create table _metrics_network as
select
a.uid,
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
a.hasInternet, a.linkSpeed, a.mobileStatus , a.signalStrength, a.wifiStatus, a.rssi, a.ssid,
b.mLinkDownBandwidthKbps, b.mLinkUpBandwidthKbps, b.mSignalStrength,
c.mMtu
FROM betterX.network as a
left join betterX.network_capabilities as b on b.network_id = a.id
left join betterX.network_linkProperties as c on c.network_id = a.id
left join betterX.setup on betterX.setup.uid = a.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
group by a.uid,
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)),
a.hasInternet, a.linkSpeed, a.mobileStatus , a.signalStrength, a.wifiStatus, a.rssi, a.ssid,
b.mLinkDownBandwidthKbps, b.mLinkUpBandwidthKbps, b.mSignalStrength,
c.mMtu;

ALTER TABLE `betterX`.`_metrics_network` 
ADD INDEX `index1` (`uid` ASC)  COMMENT '',
ADD INDEX `index2` (`timestamp` ASC)  COMMENT '';


create table _metrics_phoneState as
select
a.uid,
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(distinct(`data`)), ',', '|') as `value`
FROM betterX.sensor_phoneState as a
left join betterX.setup on betterX.setup.uid = a.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
group by a.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr));

ALTER TABLE `betterX`.`_metrics_phoneState` 
ADD INDEX `index1` (`uid` ASC)  COMMENT '',
ADD INDEX `index2` (`timestamp` ASC)  COMMENT '';

create table _metrics_phoneScreen as
select
a.uid,
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `timestamp`,
replace(GROUP_CONCAT(distinct(`status`)), ',', '|') as `value`
FROM betterX.sensor_screen as a
left join betterX.setup on betterX.setup.uid = a.uid 
left join betterX._user_timeZones on betterX._user_timeZones.tzone_raw = betterX.setup.timezone
group by a.uid, 
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(a.`epoch` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr));

ALTER TABLE `betterX`.`_metrics_phoneScreen` 
ADD INDEX `index1` (`uid` ASC)  COMMENT '',
ADD INDEX `index2` (`timestamp` ASC)  COMMENT '';

alter table _user_webSessions
add column app_day_cnt int ,
add column app_latest_time bigint ,
add column app_latest_name varchar(350) ,
add column app_after_time bigint ,
add column app_after_name varchar(35) ,
add column battery_latest_time bigint ,
add column battery_latest_status varchar(100) ,
add column battery_latest_value int ,
add column battery_latest_temp int ,
add column battery_after_time bigint ,
add column battery_after_status varchar(100) ,
add column battery_after_value int ,
add column battery_after_temp int ,
add column connection_latest_time bigint ,
add column connection_latest_type varchar(100) ,
add column connection_latest_roaming varchar(100) ,
add column connection_latest_ssid varchar(100) ,
add column connection_latest_strength int ,
add column connection_latest_connected char(10) ,
add column connection_latest_connecting char(10) ,
add column connection_latest_available char(10) ,
add column connection_after_time bigint ,
add column connection_after_type varchar(100) ,
add column connection_after_roaming varchar(100) ,
add column connection_after_ssid varchar(100) ,
add column connection_after_strength int ,
add column connection_after_connected char(10) ,
add column connection_after_connecting char(10) ,
add column connection_after_available char(10) ,
add column network_latest_time bigint ,
add column network_latest_hasInternet varchar(45) ,
add column network_latest_linkSpeed int ,
add column network_latest_mobile varchar(100) ,
add column network_latest_signalStrength int ,
add column network_latest_wifi varchar(45) ,
add column network_latest_rssi int ,
add column network_latest_ssid varchar(200) ,
add column network_latest_mLinkDown bigint ,
add column network_latest_mLinkUp bigint ,
add column network_latest_mSignalStrength int ,
add column network_latest_mMtu int ,
add column network_after_time bigint ,
add column network_after_hasInternet varchar(45) ,
add column network_after_linkSpeed int ,
add column network_after_mobile varchar(100) ,
add column network_after_signalStrength int ,
add column network_after_wifi varchar(45) ,
add column network_after_rssi int ,
add column network_after_ssid varchar(200) ,
add column network_after_mLinkDown bigint ,
add column network_after_mLinkUp bigint ,
add column network_after_mSignalStrength int ,
add column network_after_mMtu int ,
add column phone_state_latest_time bigint ,
add column phone_state_latest_value varchar(341) ,
add column phone_state_after_time bigint ,
add column phone_state_after_value varchar(341) ,
add column phone_screen_latest_time bigint ,
add column phone_screen_latest_value varchar(341) ,
add column phone_screen_after_time bigint ,
add column phone_screen_after_value varchar(341);

CALL append_metrics_user_webSessions();

#export in excel and run analysis
SELECT * FROM betterX._user_webSessions limit 99999999999;

## additional calcualtions/reports
##################################
create table betterX._metrics_phoneState2 as
SELECT 
    uid,
    `timestamp`,
    `value`,
    ROUND (   
        (
            LENGTH(`value`)
            - LENGTH( REPLACE ( `value`, "CALL_STATE_RINGING", "") ) 
        ) / LENGTH("CALL_STATE_RINGING")        
    ) AS count_call_in ,
     ROUND (   
        (
            LENGTH(`value`)
            - LENGTH( REPLACE ( `value`, "CALL_STATE_OUTGOING", "") ) 
        ) / LENGTH("CALL_STATE_OUTGOING")        
    ) AS count_call_out 
FROM betterX._metrics_phoneState;

##export
select uid, dayofyear(from_unixtime(`timestamp`)) as `dayOfYear`, sum(count_call_in) as calls_in, sum(count_call_out) as calls_out
from _metrics_phoneState2
group by uid, dayofyear(from_unixtime(`timestamp`))
limit 99999999999999;

##export
select uid, dayofyear(from_unixtime(`timestamp`)) as `dayOfYear`, 
#sum(IF (`value` = 'SCREEN_OFF',1,0)) count_screen_off,
#sum(IF (`value` = 'SCREEN_ON',1,0)) count_screen_on,
ROUND((sum(IF (`value` = 'SCREEN_OFF',1,0)) + sum(IF (`value` = 'SCREEN_ON',1,0))) / 2 )as screen_changes
from _metrics_phoneScreen
group by uid, dayofyear(from_unixtime(`timestamp`))
limit 99999999999999;


#########################################################
## Delete All Data
#########################################################
"""
delete from betterX.apps where 1=1;
delete from betterX.features where 1=1;
delete from betterX.file_log where 1=1;
#delete from betterX.gcm_msgs where 1=1;
#delete from betterX.gcm_users where 1=1;
delete from betterX.network where 1=1;
delete from betterX.network_availableNetwork where 1=1;
delete from betterX.network_capabilities where 1=1;
delete from betterX.network_linkProperties where 1=1;
delete from betterX.network_linkProperties_mLinkAddresses where 1=1;
delete from betterX.network_linkProperties_mRoutes where 1=1;
delete from betterX.sensor_accelerometer_data where 1=1;
delete from betterX.sensor_accelerometer where 1=1;
delete from betterX.sensor_battery where 1=1;
delete from betterX.sensor_connection where 1=1;
delete from betterX.sensor_connectionStrength where 1=1;
delete from betterX.sensor_gyroscope_data where 1=1;
delete from betterX.sensor_gyroscope where 1=1;
delete from betterX.sensor_light where 1=1;
delete from betterX.sensor_location_data where 1=1;
delete from betterX.sensor_location where 1=1;
delete from betterX.sensor_magneticField_data where 1=1;
delete from betterX.sensor_magneticField where 1=1;
delete from betterX.sensor_passiveLocation where 1=1;
delete from betterX.sensor_phoneState where 1=1;
delete from betterX.sensor_screen where 1=1;
delete from betterX.sensor_stepCounter where 1=1;
delete from betterX.sensor_WiFi_scanResult where 1=1;
delete from betterX.sensor_WiFi where 1=1;
delete from betterX.setup where 1=1;
delete from betterX.tickets where 1=1;
delete from betterX.web_entries where 1=1;
delete from betterX.web_entries_request where 1=1;
delete from betterX.web_entries_response where 1=1;
delete from betterX.web_info where 1=1;
delete from betterX.web_pages where 1=1;
delete from betterX.web_tabs where 1=1;
"""