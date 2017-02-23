## current_user_stories
########################################

drop table if exists _user_readings;

create table _user_readings
(
	uid varchar(255) not null,
    timestmp timestamp not null,
    `feed` varchar(100) not null,
    `description` varchar(200) null
);

ALTER TABLE `betterX`.`_user_readings` 
ADD INDEX `index1` (`uid` ASC)  COMMENT '',
ADD INDEX `index2` (`timestmp` ASC)  COMMENT '',
ADD INDEX `index3` (`feed` ASC)  COMMENT '',
ADD INDEX `index4` (`description` ASC)  COMMENT '';

insert into _user_readings

SELECT 
uid, timestamp(from_unixtime( cast(cast(`timestamp` as char(10)) as unsigned) )) as `timestmp`, 
'App' COLLATE utf8_unicode_ci as `feed`,
concat('App Open ', ' (', app, ')' ) COLLATE utf8_unicode_ci as `action` 
FROM betterX.apps
union
SELECT 
uid, timestamp(from_unixtime( cast(cast(`epoch` as char(10)) as unsigned) )) as `timestmp`,
'Network' COLLATE utf8_unicode_ci as `feed`,
concat('Network (',
concat('State=', if (detailedState is not null, detailedState, '')), ' ',
concat('Mobile=', if (mobileStatus is not null, mobileStatus, '')),  ' ',
concat('Wifi=', if (wifiStatus is not null, wifiStatus, '')), ' ',
concat('wiMax=', if (wiMaxStatus is not null, wiMaxStatus, '')), ' ',
concat('Web=', if (hasInternet = 1, 'Y', 'N')), ' ',
concat('Signal=', if (signalStrength is not null, cast(signalStrength as char(5)), '')), ' ',
concat('Speed=', if (linkSpeed is not null, cast(linkSpeed as char(10)), '')), ')') COLLATE utf8_unicode_ci as `action`
FROM betterX.network
union
SELECT 
uid, timestamp(from_unixtime( cast(cast(`epoch` as char(10)) as unsigned) )) as `timestmp`, 
'Battery' COLLATE utf8_unicode_ci as `feed`,
concat('Battery (', 
'Level=',
cast(`level` as char(10)),
'/',
cast(`scale` as char(10)),
' Plugged=',
if (plugged = 1, 'Y', 'N'),
' Stat=',
if (`status` is not null, `status`, ' '),
' Health=',
if (`health` is not null, `health`, ' ')
, ')' ) COLLATE utf8_unicode_ci as `action`
FROM betterX.sensor_battery
union
SELECT 
uid, timestamp(from_unixtime( cast(cast(`epoch` as char(10)) as unsigned) )) as `timestmp`,
'Connection' COLLATE utf8_unicode_ci as `feed`,
concat('Connection (',
concat('Type=', if (networkType is not null, networkType, '')), ' ',
concat('Roaming=', if (roaming is not null, roaming, '')),  ' ',
concat('Available=', if (available = 1 , 'Y', 'N')), ' ',
concat('Connect=', if (connected = 1 , 'Y', 'N')), '/', if (connecting = 1, 'Y', 'N'),')' ) COLLATE utf8_unicode_ci as `action`
FROM betterX.`sensor_connection`
union
SELECT 
uid, timestamp(from_unixtime( cast(cast(`epoch` as char(10)) as unsigned) )) as `timestmp`,
'Connection Strength' COLLATE utf8_unicode_ci as `feed`,
concat('Connection Strength (',
cast(strength as char(10))
,')' ) COLLATE utf8_unicode_ci as `action`
FROM betterX.`sensor_connectionStrength`
union
SELECT 
a.uid, timestamp(from_unixtime( cast(cast(`time` as char(10)) as unsigned) )) as `timestmp`,
'Location' COLLATE utf8_unicode_ci as `feed`,
concat(
'Location (',
'Cord=', if (latitude is not null, cast(latitude as char(20)), ''), ',',
if(longitude is not null, cast(longitude as char(20)), ''), ' ',
'Accuracy=', 
if(accuracy is not null, cast(accuracy as char(20)), ''), ' ',
'Speed=', 
if(speed is not null, cast(speed as char(20)), ''), ' ',
'Bearing=', 
if(bearing is not null, cast(bearing as char(20)), ''), ' ',
'Provider=', 
if(provider is not null, cast(provider as char(20)), ''), 
')' ) COLLATE utf8_unicode_ci as `action`
FROM betterX.sensor_location as a
join betterX.sensor_location_data as b on a.id = b.id
union
SELECT 
a.uid, timestamp(from_unixtime( cast(cast(`time` as char(10)) as unsigned) )) as `timestmp`,
'Local Time' COLLATE utf8_unicode_ci as `feed`,
concat(
'Local Time (',
b.local_time,
')' ) COLLATE utf8_unicode_ci as `action`
FROM betterX.sensor_location as a
join betterX.sensor_location_data as b on a.id = b.id
union
SELECT 
uid, timestamp(from_unixtime( cast(cast(`time` as char(10)) as unsigned) )) as `timestmp`,
'Passive Location' COLLATE utf8_unicode_ci as `feed`,
concat(
'Passive Location (',
'Cord=', if (latitude is not null, cast(latitude as char(20)), ''), ',',
if(longitude is not null, cast(longitude as char(20)), ''), ' ',
'Accuracy=', 
if(accuracy is not null, cast(accuracy as char(20)), ''), ' ',
'Speed=', 
if(speed is not null, cast(speed as char(20)), ''), ' ',
'Bearing=', 
if(bearing is not null, cast(bearing as char(20)), ''), ' ',
'Provider=', 
if(provider is not null, cast(provider as char(20)), ''), 
')' ) COLLATE utf8_unicode_ci as `action`
FROM betterX.sensor_passiveLocation
union
SELECT
uid,  timestamp(from_unixtime( cast(cast(`epoch` as char(10)) as unsigned) )) as `timestmp`,
'Phone State' COLLATE utf8_unicode_ci as `feed`,
trim(CONCAT('Phone State (',
if (left(`data`, 10) = 'CALL_STATE', trim(`data`), ''),
if (left(`data`, 13) = 'DATA_ACTIVITY', trim(`data`), ''),
if (left(`data`, 14) = 'DATA_CONNECTED', trim(`data`), ''),
if (left(`data`, 17) = 'DATA_DISCONNECTED', trim(`data`), ''),
if (left(`data`, 14) = 'DATA_SUSPENDED', trim(`data`), ''),
if (left(`data`, 20) = 'STATE_EMERGENCY_ONLY', trim(left(`data`, locate(' ', `data`))), ''),
if (left(`data`, 16) = 'STATE_IN_SERVICE', trim(left(`data`, locate(' ', `data`))), ''),
if (left(`data`, 20) = 'STATE_OUT_OF_SERVICE', trim(left(`data`, locate(' ', `data`))), ''),
if (left(`data`, 15) = 'STATE_POWER_OFF', trim(left(`data`, locate(' ', `data`))), ''),')')) COLLATE utf8_unicode_ci as `action`
FROM betterX.sensor_phoneState
union
SELECT 
uid, timestamp(from_unixtime( cast(cast(`epoch` as char(10)) as unsigned) )) as `timestmp`,
'Screen' COLLATE utf8_unicode_ci as `feed`,
concat(
'Screen (',
`status`,
')' ) COLLATE utf8_unicode_ci as `action`
FROM sensor_screen
union
SELECT 
uid, timestamp(from_unixtime( cast(cast(`epoch` as char(10)) as unsigned) )) as `timestmp`,
'Steps' COLLATE utf8_unicode_ci as `feed`,
concat(
'Steps (',
`stepCount`,
')' ) COLLATE utf8_unicode_ci as `action`
FROM sensor_stepCounter
union
select * from activity_tabs_per_uid
UNION
select * from activity_page_start_per_uid;

### USER LOCATIONS
drop table if exists _user_locations;
create table _user_locations
(
	uid varchar(255) not null,
    timestmp timestamp not null,
    unxTm bigint not null,
    latitude float(12,9) not null,
    longitude float(12,9) not null,
    accuracy varchar(200) null
);
ALTER TABLE `betterX`.`_user_locations` 
ADD INDEX `index1` (`uid` ASC)  COMMENT '',
ADD INDEX `index2` (`timestmp` ASC)  COMMENT '',
ADD INDEX `index3` (`latitude` ASC)  COMMENT '',
ADD INDEX `index4` (`longitude` ASC)  COMMENT '',
ADD INDEX `index5` (`accuracy` ASC)  COMMENT '';
insert into _user_locations
select uid, timestmp, `time`, latitude, longitude, accuracy from 
(
	select uid, timestamp(from_unixtime( cast(cast(`time` as char(10)) as unsigned) )) as `timestmp`, `time`,
	latitude, longitude, accuracy
	from sensor_location
	left join sensor_location_data on sensor_location.id = sensor_location_data.sensor_location_id
	group by uid, `timestmp`, `time`, latitude, longitude, accuracy
    
	union

	select uid, timestamp(from_unixtime( cast(cast(`epoch` as char(10)) as unsigned) )) as `timestmp`, epoch as `time`,
	latitude, longitude, accuracy
	from sensor_passiveLocation 
) as a
group by uid, timestmp, `time`, latitude, longitude, accuracy;

#################
## User WebPages
#################
drop table if exists _user_webPages;
create table betterX._user_webPages
(
    
    `Host_Name` varchar(250) not null primary key,
    `Title` varchar(200) null,
    `Description` varchar(200) null,
    `Speed_MediaLoadingTime` int null,
    `Speed_Percentile` int null,
    `Category1` varchar(200) null,
    `Category2` varchar(200) null,
    `Category3` varchar(200) null
);
drop table if exists _user_webRequests;
create table _user_webRequests as
SELECT id, web_entries_id, url
FROM betterX.web_entries_request
order by id, web_entries_id, url;

ALTER TABLE `betterX`.`_user_webRequests` 
CHANGE COLUMN `id` `id` BIGINT(20) NOT NULL COMMENT '' ,
ADD PRIMARY KEY (`id`)  COMMENT '';

alter table `betterX`.`_user_webRequests`  add column domain varchar(255);
## Run domain parsing script
## python betterX-parse-domain.py

insert into betterX._user_webPages (Host_Name)
select distinct(domain) from betterX._user_webRequests where domain is not null and domain <> '' group by domain;
## Run alexa api script
## python betterX-alexa-api-search.py

###########################
## User Address on Geoocode
###########################
drop table if exists _user_geolocations; 

create table _user_geolocations
(
	`Latitude` float(12,9) not null,
    `Longitude` float(12,9) not null,
    `Address` varchar(250) null
);

ALTER TABLE `betterX`.`_user_geolocations` 
ADD PRIMARY KEY (`Latitude`, `Longitude`)  COMMENT '';

insert into _user_geolocations (Latitude, Longitude)
SELECT latitude, longitude
FROM betterX._user_locations
where (latitude,longitude) not in (select latitude, longitude from _user_geolocations)
group by latitude, longitude
order by latitude, longitude;

select count(*) from _user_geolocations; #17685
## Run reverse geocoder
## python betterX-reverse-geocode.py

###########################
## User Web Sessions Table
###########################
drop table if exists _user_webSessions;
create table _user_webSessions as
SELECT 
    `a`.`uid`,
    `a`.`tabid`,
    `a`.tbl_id,
    `a`.`pageStartTime`,
    UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime(cast(cast(a.pageStartTime as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `userTimestamp`,
    CONVERT_TZ(from_unixtime( cast(cast(a.pageStartTime as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr) as `userTime`,
    `a`.`pageTitle`,
    `a`.`pageOnContentLoad`,
    `a`.`pageOnLoad`,
    `a`.`origin`,
    `b`.`entryStartTime`,
    `b`.`time`,
    `b`.`serverIPAddress`,
    `b`.`connection`,
    `b`.`blocked`,
    `b`.`dns`,
    `b`.`connect`,
    `b`.`send`,
    `b`.`wait`,
    `b`.`receive`,
    `b`.`ssl`,
    `b`.`beforeRequestCacheEntries`,
    `b`.`afterRequestCacheEntries`,
    `b`.`hitCount`,
    `c`.`method`,
    `c`.`url`,
    `c`.`httpVersion` as httpVersionRequest,
    `c`.`cookieNumber`as cookieNumberRequest,
    `c`.`header_Host`,
    `c`.`header_UserAgent`,
    `c`.`header_Accept`,
    `c`.`header_AcceptEncoding`,
    `c`.`header_Connection`as header_ConnectionRequest,
    `c`.`header_ContentLength`as header_ContentLengthRequest,
    `c`.`header_KeepAlive` as header_KeepAliveRequest,
    `c`.`headerSize`,
    `c`.`bodySize`as bodySizeRequest,
	`d`.`status`,
    `d`.`statusText`,
    `d`.`httpVersion` as httpVersionResponse,
    `d`.`cookieNumber`as cookieNumberResponse,
    `d`.`header_Date`,
    `d`.`header_Server`,
    `d`.`header_XPoweredBy`,
    `d`.`header_ContentEncoding`,
    `d`.`header_ContentLength`as header_ContentLengthResponse,
    `d`.`header_KeepAlive`as header_KeepAliveResponse,
    `d`.`header_Connection`as header_ConnectionResponse,
    `d`.`header_ContentType`,
    `d`.`redirectUrl`,
    `d`.`headersSize`,
    `d`.`bodySize`as bodySizeResponse,
    `d`.`content_size`,
    `d`.`content_compression`,
    `d`.`content_mimeType`,
    `d`.`content_encoding`,
    `e`.`domain`,
    `f`.`Host_Name`,
    `f`.`Title`,
    `f`.`Description`,
    `f`.`Speed_MediaLoadingTime`,
    `f`.`Speed_Percentile`,
    `f`.`Category1`,
    `f`.`Category2`,
    `f`.`Category3`,
    timestamp(from_unixtime( cast(cast(`pageStartTime` as char(10)) as unsigned) )) as `timestmp`
FROM betterX.web_pages as a
inner join betterX.web_entries as b on a.id = b.pageid and a.pageStartTime = b.entryStartTime
inner join betterX.web_entries_request as c on b.id = c.web_entries_id
inner join betterX.web_entries_response as d on b.id = d.web_entries_id
inner join betterX._user_webRequests as e on e.id = c.id
left join  betterX._user_webPages as f on f.Host_name = e.domain
left join setup on setup.uid =  a.uid 
left join _user_timeZones on _user_timeZones.tzone_raw = setup.timezone
order by uid asc, `userTimestamp` asc;

## web session duration
#######################
drop table if exists _temp_webDuration;
create table _temp_webDuration
(
	id int auto_increment primary key,
    tbl_id bigint not null,
    uid varchar(255) NOT NULL,
    feed varchar(255) NOT NULL,
    timestmp timestamp NOT NULL,
    unix_stamp bigint NOT NULL,
    duration int NULL
);
insert into _temp_webDuration (uid, tbl_id, feed, timestmp, unix_stamp )
SELECT uid, tbl_id, 'Web Session Start', userTime, userTimestamp
FROM betterX._user_webSessions
order by uid, userTimestamp asc;
update _temp_webDuration set duration = null;
CALL append_duration_temp_webDuration();
select * from _temp_webDuration order by uid asc, timestmp asc;
alter table _temp_webDuration add column tabid int NULL;
update _temp_webDuration, _user_webSessions
set _temp_webDuration.tabid = _user_webSessions.tabid
where _temp_webDuration.tbl_id = _user_webSessions.tbl_id;
alter table _temp_webDuration add column tabOpenUnix bigint NULL;
CALL append_tabOpen_temp_webDuration();
alter table _temp_webDuration add column tabCloseUnix bigint NULL;
CALL append_tabClose_temp_webDuration();
alter table _user_webSessions add durationSession bigint;
alter table _user_webSessions add tabOpenTm bigint;
alter table _user_webSessions add tabCloseTm bigint;
alter table _user_webSessions add durationTab bigint;
update _user_webSessions, _temp_webDuration
set 
_user_webSessions.durationSession = _temp_webDuration.duration,
_user_webSessions.tabOpenTm = _temp_webDuration.tabOpenUnix,
_user_webSessions.tabCloseTm = _temp_webDuration.tabCloseUnix,
_user_webSessions.durationTab = TIMESTAMPDIFF(SECOND,
timestamp(from_unixtime( cast(cast(`tabOpenUnix` as char(10)) as unsigned) )) ,
timestamp(from_unixtime( cast(cast(`tabCloseUnix` as char(10)) as unsigned) )))
where _user_webSessions.tbl_id = _temp_webDuration.tbl_id;
alter table _user_webSessions add estimateDuration bigint;
update _user_webSessions set estimateDuration = durationSession;
update _user_webSessions set estimateDuration = durationTab where durationTab < durationSession;
drop table _temp_webDuration;
alter table _user_webSessions add location_address varchar(250);
alter table _user_webSessions add location_accuracy bigint;
alter table _user_webSessions add location_unxTm bigint;

#web session location
######################
drop table if exists _temp;
create table _temp as
SELECT betterX._user_locations.uid, betterX._user_locations.`unxTm`,
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(`unxTm` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) as `userTimestamp`,
betterX._user_locations.latitude, betterX._user_locations.longitude,
betterX._user_locations.accuracy, betterX._user_geolocations.address
FROM betterX._user_locations
left join setup on setup.uid =  betterX._user_locations.uid 
left join _user_timeZones on _user_timeZones.tzone_raw = setup.timezone
join betterX._user_geolocations on betterX._user_geolocations.Latitude = betterX._user_locations.latitude
and betterX._user_geolocations.Longitude = betterX._user_locations.longitude
group by betterX._user_locations.uid, betterX._user_locations.`unxTm`,
UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(`unxTm` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)),
betterX._user_locations.latitude, betterX._user_locations.longitude,
betterX._user_locations.accuracy, betterX._user_geolocations.address
order by betterX._user_locations.uid asc, UNIX_TIMESTAMP(CONVERT_TZ(from_unixtime( cast(cast(`unxTm` as char(10)) as unsigned) ), 'UTC', betterX._user_timeZones.tzone_abbr)) asc;
ALTER TABLE `betterX`.`_temp` 
ADD COLUMN `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '' AFTER `address`,
ADD PRIMARY KEY (`id`)  COMMENT '';
CALL append_location_user_webSessions();
drop table _temp;

#timezones
######################
create table _user_timeZones 
(
	tzone_raw varchar(255) not null,
    tzone_abbr varchar(255) null
);

insert into _user_timeZones (tzone_raw)
SELECT distinct(timezone) FROM betterX.setup;
SELECT * FROM betterX._user_timeZones;
update _user_timeZones set tzone_abbr = 'CET' where tzone_raw in ('Central European Standard Time', 'Central European Time');
update _user_timeZones set tzone_abbr = 'US/Central' where tzone_raw in ('Central Standard Time');
update _user_timeZones set tzone_abbr = 'EET' where tzone_raw in ('Eastern European Standard Time', 'Ώρα Ανατολικής Ευρώπης');
update _user_timeZones set tzone_abbr = 'US/Eastern' where tzone_raw in ('Eastern Standard Time');
update _user_timeZones set tzone_abbr = 'US/Pacific' where tzone_raw in ('Pacific Standard Time');
update _user_timeZones set tzone_abbr = '+3:00' where tzone_raw in ('Χειμερινή ώρα Ανατολικής Ευρώπης');
update _user_timeZones set tzone_abbr = '+5:00' where tzone_raw in ('Maldives Time');
update _user_timeZones set tzone_abbr = '+05:30' where tzone_raw in ('India Standard Time');