# Xcode workspace opener function
function oxc() {
  local workspace=$(find . -maxdepth 1 -name "*.xcworkspace" | head -n 1)

  if [[ -z "$workspace" ]]; then
    echo "No .xcworkspace file found in the current directory."
    return 1
  fi

  command open "$workspace"
  echo "Opened $workspace"
}
