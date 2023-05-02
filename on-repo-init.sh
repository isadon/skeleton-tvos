#!/bin/sh

HOOKS_DIR=.git/hooks
PRE_COMMIT_GIT_HOOK_PATH=$HOOKS_DIR/pre-commit

mkdir -p $HOOKS_DIR

cat > $PRE_COMMIT_GIT_HOOK_PATH <<'EOF'
#!/bin/sh

./swiftformat-staged.sh
EOF

chmod +x $PRE_COMMIT_GIT_HOOK_PATH

## Remove Skeleton Changelogs
SKEL_CHG1=SKELETON_CHANGELOG.md
SKEL_CHG2=SKELETON_CHANGELOG_DEV.md

if [ -e $SKEL_CHG1 ]
then
  rm -f $SKEL_CHG1
  echo "Removed $SKEL_CHG1"
fi

if [ -e $SKEL_CHG2 ]
then
  rm -f $SKEL_CHG2
  echo "Removed $SKEL_CHG2"
fi

## Install Swift Format
echo "Preparing to install swiftformat to BuildTools/.build/release/swiftformat"
swift build -c release --package-path BuildTools --product swiftformat
