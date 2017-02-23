# BetterX-Dataset
The BetterX Dataset consists of live data collected from anonymous mobile devices users and is the product of the first data collection effort of the [BetterX](https://github.com/eliasall/BetterX.org) research project.

### [Data](https://github.com/eliasall/BetterX-Dataset/tree/master/data)

* Anonymized & Classified User Data
  * Live Web Sessions (2727 web sessions from various mobile users in various locations)
  * Lab Web Sessions (339 web sessions from a lab study)
  * Lab Web Experience Responses (31 participants, smartphone & tablet web experience scores)

* Discretized Data (used in Bayesian MWQoE model)
  * DCS (Device Context State data)
  * NCS (Network Context State data)
  * TCS (Timings (web) Context State data)
  * ICS (Intent Importance Context State data)

### [Model](https://github.com/eliasall/BetterX-Dataset/tree/master/model)
Mobile Web Quality of Experience (MWQoE) is a Bayesian Network model which scores (1-5) the experience of the mobile web user in browsing.  The model takes into account the Device context, the Network context, the Web timings (Page load, etc), the Web User Profile, the Web User Location and the Web User Task (Intention) for each observed web session.  The model is coded in [GeNIe](https://www.bayesfusion.com/genie-modeler) and can be made available upon request.

### [Schemas](https://github.com/eliasall/BetterX-Dataset/tree/master/schemas)
MySQL & Cassandra database schemas

### [Scripts](https://github.com/eliasall/BetterX-Dataset/tree/master/sql)
MySQL data loading and reporting scripts


### License
_Copyright 2017 Elias Allayiotis_

_Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0_

_Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License._
