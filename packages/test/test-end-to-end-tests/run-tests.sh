mkdir -p ./testRuns

STATUS=0
COUNTER=0
while [ $STATUS -eq 0 ]
do
  if [ $COUNTER -gt 100 ]
	then
		echo "Ran 100 times with no failures. Stopping";
		exit 0;
	fi

	# Clean up output files from previous runs so we keep used space under control. Ignore failures (if there are no files).
	rm ./testRuns/* > /dev/null

	COUNTER=$((COUNTER+1))
	TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
	OUTPUT_FILE=$TIMESTAMP.log

	echo "Running tests ($COUNTER)...output file: ./testRuns/$OUTPUT_FILE"
	npm run test:realsvc:routerlicious:report --compatVersion=0 > ./testRuns/$OUTPUT_FILE 2>&1
	STATUS=$?
done

echo "Tests failed with status $STATUS"
