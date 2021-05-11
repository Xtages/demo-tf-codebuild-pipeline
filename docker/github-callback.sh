BODY_PAYLOAD="\`\`\`$@"
jq -n --arg plan "$BODY_PAYLOAD" '{body: $plan}' > plan.txt
PR_NO=${CODEBUILD_WEBHOOK_TRIGGER:3}
ORG=your_gh_org_here
REPO=live-terraform-pipeline-example
curl --fail -u $USER:$TOKEN -X POST \
  https://api.github.com/repos/$ORG/$REPO/issues/$PR_NO/comments \
  -H 'Accept:  application/vnd.github.v3+json' \
  -H 'Content-Type: application/json' \
  -d @plan.txt
