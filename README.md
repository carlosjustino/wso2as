wso2as
=============

Dockerfile for WSO2 Application Server 5.3.0 - http://wso2.com/products/application-server/

Start a WSO2 AS docker container
--------------------------------
docker run --rm -it -p 9443:9443 -v C:\carlosj\apps\docker\volumes\conf:/opt/wso2/producaoApp/repository/conf -v C:\carlosj\apps\docker\volumes\database:/opt/wso2/producaoApp/repository/database --name wso2aslocal wso2as


Access management console
-------------------------
https://localhost:9443/carbon
