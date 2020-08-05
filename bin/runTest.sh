until TEST_E2E_WAIT_FOR_ANGULAR=true yarn e2e --cucumberOpts.tags=$1;
do
  echo "executing test again in 10 secs..."
  sleep 10
done

