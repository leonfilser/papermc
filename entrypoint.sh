#!/bin/bash

#credits: https://github.com/Phyremaster/papermc-docker/blob/master/papermc.sh

# Get version information and build download URL and jar name
URL=https://papermc.io/api/v2/projects/paper

if [ ${VERSION} = latest ]
then
  # Get the latest MC version
  VERSION=$(wget -qO - $URL | jq -r '.versions[-1]') # "-r" is needed because the output has quotes otherwise
fi

echo "Using Minecraft Version " ${VERSION}

URL=${URL}/versions/${VERSION}

# Get the latest build
PAPER_BUILD=$(wget -qO - $URL | jq '.builds[-1]')
JAR_NAME=paper-${VERSION}-${PAPER_BUILD}.jar
URL=${URL}/builds/${PAPER_BUILD}/downloads/${JAR_NAME}


# Update if necessary
if [ ! -e ${JAR_NAME} ]
then
  # Remove old server jar(s)
  rm -f *.jar
  # Download new server jar
  wget ${URL} -O ${JAR_NAME}
  
  # If this is the first run, accept the EULA
  if [ ! -e eula.txt ]
  then
    # Run the server once to generate eula.txt
    java -jar ${JAR_NAME}
    # Edit eula.txt to accept the EULA
    sed -i 's/false/true/g' eula.txt
  fi
fi

echo "Starting MC Server"

java -Xms${XMS} -Xmx${XMG} -jar ${JAR_NAME} nogui
