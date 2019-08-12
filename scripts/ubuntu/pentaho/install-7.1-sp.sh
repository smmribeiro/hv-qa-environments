#!/bin/bash

if [ -z "$1" ]; then
  INPUT_PATCH_VERSION=7.1.0.26-212
  echo "patch version defaulted to $INPUT_PATCH_VERSION"
else
  INPUT_PATCH_VERSION=$1
  echo "patch version defined by user as $INPUT_PATCH_VERSION"
fi

export INSTALLERS_BASE=/host/builds/sp/
export PENTAHO_TO_PATCH=/home/vagrant/Pentaho/
export PATCH_VERSION=$INPUT_PATCH_VERSION
export LOG_BASE=/host/logs/$PATCH_VERSION

if [ -e $LOG_BASE ]; then
	echo "logs folder already exists"
else
	echo "creating logs folder"
	mkdir $LOG_BASE
fi

echo "Patching pentaho-server with $PATCH_VERSION"
$INSTALLERS_BASE/PentahoServer-SP-$PATCH_VERSION.bin -i silent -DEULA_ACCEPT=true -DUSER_INSTALL_DIR=$PENTAHO_TO_PATCH/server/pentaho-server -DSILENT_LOG=$LOG_BASE/pentaho-server.log

echo "Patching aggregation-designer with $PATCH_VERSION"
$INSTALLERS_BASE/AggregationDesigner-SP-$PATCH_VERSION.bin -i silent -DEULA_ACCEPT=true -DUSER_INSTALL_DIR=$PENTAHO_TO_PATCH/design-tools/aggregation-designer -DSILENT_LOG=$LOG_BASE/aggregation-designer.log

echo "Patching data-integration with $PATCH_VERSION"
$INSTALLERS_BASE/PDIClient-SP-$PATCH_VERSION.bin -i silent -DEULA_ACCEPT=true -DUSER_INSTALL_DIR=$PENTAHO_TO_PATCH/design-tools/data-integration -DSILENT_LOG=$LOG_BASE/data-integration.log

echo "Patching metadata-editor with $PATCH_VERSION"
$INSTALLERS_BASE/MetadataEditor-SP-$PATCH_VERSION.bin -i silent -DEULA_ACCEPT=true -DUSER_INSTALL_DIR=$PENTAHO_TO_PATCH/design-tools/metadata-editor -DSILENT_LOG=$LOG_BASE/metadata-editor.log

echo "Patching report-designer with $PATCH_VERSION"
$INSTALLERS_BASE/ReportDesigner-SP-$PATCH_VERSION.bin -i silent -DEULA_ACCEPT=true -DUSER_INSTALL_DIR=$PENTAHO_TO_PATCH/design-tools/report-designer -DSILENT_LOG=$LOG_BASE/report-designer.log

echo "Patching schema-workbench with $PATCH_VERSION"
$INSTALLERS_BASE/SchemaWorkbench-SP-$PATCH_VERSION.bin -i silent -DEULA_ACCEPT=true -DUSER_INSTALL_DIR=$PENTAHO_TO_PATCH/design-tools/schema-workbench -DSILENT_LOG=$LOG_BASE/schema-workbench.log
