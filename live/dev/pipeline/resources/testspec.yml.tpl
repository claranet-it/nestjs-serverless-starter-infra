version: 0.2

env:
  shell: bash

phases:
  install:
    runtime-versions:
      nodejs: 20
    commands:
      - echo "### Installing pnpm..."
      - npm install -g pnpm
      - echo "### Installing dependencies..."
      - pnpm install      
  pre_build:
    commands:      
      - echo "### Download parameters from SSM/ParameterStore (do escape directly on ssm)..."
      - aws ssm get-parameter --with-decryption --name /pipeline/${PIPELINE_NAME} --query Parameter.Value --output text > .env.${STAGE_NAME}.local     
      - cat .env.${STAGE_NAME}.local | sed -nr 's/(^.*=.*$)/declare -x \1/p' > .aws.ssm.local
      - source .aws.ssm.local
  build:
    commands:
      - echo "### Running lint..."
      - pnpm run lint
      - echo "### Running tests..."
      - pnpm run test
  post_build:
    commands:
      - echo "Tests completed on `date`"
