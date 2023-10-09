# Function to display Git branch and status
git_prompt() {
  local branch_name
  branch_name=$(git branch 2>/dev/null | grep '*' | sed 's/* //')
  if [[ -n "$branch_name" ]]; then
    local git_status
    git_status=$(git status --porcelain 2>/dev/null)
    if [[ -n "$git_status" ]]; then
      echo -n "[%F{red}$branch_name%F{reset} %F{yellow}✗%F{reset}] "
    else
      echo -n "[%F{green}$branch_name%F{reset}] "
    fi
  fi
}

# Customize your prompt
PS1='%F{blue}%n%f@%F{green}%m%f:%F{yellow}%~%f$(git_prompt)%F{reset}$ '

# Additional prompt customization
# You can add more elements to your prompt as needed.
# For example, adding date and time:
# PS1='%F{blue}%n%f@%F{green}%m%f:%F{yellow}%~%f$(git_prompt)%F{reset} $(date +"%H:%M:%S") $ '

