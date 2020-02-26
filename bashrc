# Enable vi-mode for shell
set -o vi

# Git auto completion (not working for now)
source ~/.git-completion.bash

# Constants
export ETS_TOOLKIT=qt4
export QT_API=pyqt
export VISUAL=vim
export EDITOR="$VISUAL"
export WORKON_HOME=$HOME/.edm/envs

# Credentials
source ~/.hatcher_credentials

# Prompt
. ~/.bash_prompt

export TERM=xterm-256color

# Alias
alias ll="ls -arltG"

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Emacs for OSX
# Installed via "brew cask install emacs"
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias emacsgui='/Applications/Emacs.app/Contents/MacOS/Emacs'

# AWS related
# Set default profile so that we don't need --profile after each aws cli
export AWS_DEFAULT_PROFILE=ehub_adm
# Extend session to 12 hrs
export SAML2AWS_SESSION_DURATION=43200
# AWS alias
alias aws-get-c5='export instanceId=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped,Name=instance-type,Values=c5.9xlarge" --query "Reservations[0].Instances[0].InstanceId"` && echo $instanceId'
alias aws-get-t2='export instanceId=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped,Name=instance-type,Values=t2.xlarge" --query "Reservations[0].Instances[0].InstanceId"` && echo $instanceId'
alias aws-get-nano='export instanceId=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped,Name=instance-type,Values=t2.nano" --query "Reservations[0].Instances[0].InstanceId"` && echo $instanceId'
alias aws-start='aws ec2 start-instances --instance-ids $instanceId && aws ec2 wait instance-running --instance-ids $instanceId && export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$instanceId" --query "Reservations[0].Instances[0].PublicIpAddress"` && export instanceIp=$instanceIp && echo $instanceIp'
alias aws-ip='export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$instanceId" --query "Reservations[0].Instances[0].PublicIpAddress"` && echo $instanceIp'
alias aws-ssh='ssh -i ~/.aws/EnergyhubKP.pem ubuntu@$instanceIp'
alias aws-stop='aws ec2 stop-instances --instance-ids $instanceId'
alias aws-state='aws ec2 describe-instances --instance-ids $instanceId --query "Reservations[0].Instances[0].State.Name"'

complete -C /usr/local/bin/mc mc
