# README

## SFIA-2-Project

This is a project completed for submission for QA. Any other related elements can be found at the following:

Project Github - https://github.com/CaelTintreach/SFIA-2-Submission

DockerHub - https://hub.docker.com/u/caeltintreach

Website - 34.105.203.3 - Node 1

​				 34.105.195.93 - Node 2

JIRA - Still cannot be linked, see placeholder image below

![](C:\SFIA-2-Submission\Documentation\JIRA Image.PNG)

### Index -

[TOC]

#### Project Brief -

For this project, I was required to develop an application consisting of four services which are hosted on the internet via GCP machines with NGINX running as a reverse proxy to control access to these machines. The four services requirements are as follows

1. The core service which will render Jinja2 templates for the user to interact with as well as being responsible for acting with the 3 other services as well as persisting some data in an SQL database.

2. This service will generate a random object.

3. As above.

4. Service will take the objects provided and compute them using logic to return a final object for service 1 to use.  

#### Requirements -

Kanban Board: JIRA

Version Control: Github

CI Server: Jenkins

Configuration Management: Ansible

Cloud Server: GCP Virtual Machines

Containerisation: Docker

Orchestration Tool: Docker Swarm

Reverse Proxy: NGINX

#### Chosen Approach -

I opted to develop the project using Python and Flask with self-derived APIs to make up each service. These APIs were deliberately limited in function to instead allocate more time developing the CI pipeline to make it more robust as well as to further solidify my own understanding.

#### Service Architecture Overview -

![](C:\SFIA-2-Submission\Documentation\Service Diagram.png)

Intended service diagram.

![](C:\SFIA-2-Submission\Documentation\Final Service Diagram.png)

Current service diagram for the application. 

#### CI Pipeline -

![](C:\SFIA-2-Submission\Documentation\SFIA 2 CI Pipeline.png)

The above is the the  CI pipeline for the application. Note DockerHub acts as the current artefact repo but this could easily be changed to a personal registry if the situation required.

#### Testing & Testing Results -

Due to the purposefully limited nature of the services included in the application, testing was also limited in scope to allow extra time in working on the CI pipeline which is arguably the most prominent part of the project. No test results provided any form of surprise and everything landed with expected parameters. I do feel that with extra time however I would attempt to reach 100% total coverage as opposed to the current spread of 100%, 100%, 100%, and % currently had.

Automated integration testing was not carried out on the service as it was deemed mostly unnecessary (the service only has one button for the user to interact with after all), however this could be added with a slightly more generous timeframe.  

#### Risk Assessment -

![](C:\SFIA-2-Submission\Documentation\Risk Assessment.PNG)

Above is an adjusted risk assessment after the issue with MySQL database access was determined to be a prominent and lasting problem which would aversely affect the project moving forward and was determined to be of scale that the risk assessment should be adjusted to include it.

#### Deployment & Deployment Activities -

Deployment of the service requires the following:

1. At least three GCP Machines, preferably running on the same regional network for ease of connection
   1. One machine configured as a control node and Jenkins build server via installing Jenkins and carrying out configuration and also logging into DockerHub
   2. One machine to act as swarm manager
   3. One machine to act as a swarm worker

Elements 2 and 3 of that list do not require any further configuration beyond being prepped for the control node to SSH into them to deliver the required files. It is also important to login into the required DockerHub account for the purposes of pushing images up. I have not automated this process as I feel this should be configured on a case by case basis and it adds little configuration time to the process and helps prevent unauthorised access and does not make assumptions as later on down the line the system may be moved to using a different registry instead if required.

New VMs can be added to the swarm by adding their name to the inventory.ini file found on the top layer of the directory. Once added and available for the control node to SSH into then the rest of deployment is totally automated by running build from the Jenkins interface. 

#### Project Issues -

As of time of writing a part of the MVP has not been implemented due to persistent bugs associated with it's implementation. Database integration presented a problem once involved at the Jenkins Pipeline level and while the point of failure has been identified, a solution could not be successfully implemented in the time remaining, even working back from a working model provided by another member of the cohort.

The database does work at the Docker Compose level, however once at the Pipeline level it will not pass ENV VARs to containers. The cause was presumed to be the use of sudo commands where it will take the ENVs from the root user, but even with a command designed to account for this the problem persisted. 

#### Acknowledgements - 

- Luke Benson & Harry Volker, my trainers at the QA Academy who have provided me the knowledge and direction to make this project completion possible.
- The DevOps July 2020 Cohort who have provided advice and suggestions to improve the project.
- My good friend Lex Kotzman who provided direction for handling issues in the development of the project.