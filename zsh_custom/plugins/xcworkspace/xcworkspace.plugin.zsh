# Xcode workspace opener function
function oxc() {
  local workspace=$(find . -maxdepth 1 -name "*.xcworkspace" | head -n 1)

  # fallback to opening first project
  if [[ -z "$workspace" ]]; then
    workspace=$(find . -maxdepth 1 -name "*.xcodeproj" | head -n 1)
  fi

  if [[ -z "$workspace" ]]; then
    echo "No .xcworkspace or .xcodeproj file found in the current directory."
    return 1
  fi

  command open "$workspace"
  echo "Opened $workspace"
}
