#!/opt/local/bin/bash
usage () {
  echo 'Usage: inc_ver -t {patch, minor, major} -f file{,file,...}'
}

# Check commands are installed
COMMANDS=( 'git' 'docker' )
for x in "${COMMANDS[@]}"; do 
  if ! command -v $x 1>/dev/null; then
    echo "$x not found" 1>&2
    exit 127
  fi
done

# Check we are in a git repository
if ! git rev-parse &>/dev/null; then
  echo "$(pwd) is not a git directory!"
  exit 79
fi

# Parse arguments
OPTIONS=":t:f:b:r:"
while getopts $OPTIONS opt "$@"; do
  case $opt in
    t) TAG=$OPTARG
    ;;
    b) BRANCH=$OPTARG
    ;;
    r) REMOTE=$OPTARG
    ;;
    f) IFS=',' read -r -a FILES <<< $OPTARG
    ;;
    \?)
      usage 1>&2
      echo "Invalid option: -$OPTARG is not implemented" 1>&2
      exit 78
    ;;
    :)
      usage 1>&2
      echo "-$OPTARG requires an argument" 1>&2
      exit 22
    ;;
  esac
done

# Validations and default checking
: ${TAG:='patch'}
if [[ $TAG != 'patch' && $TAG != 'minor' && $TAG != 'major' ]]; then
  usage
  echo '-t must be in {patch, minor, major}' 
  exit 22
fi
: ${BRANCH:='main'}
: ${README:='origin'}

# as ARR[@] cannot be assigne to, we must specify manually...
# Requires at least bash 4.2
[[ -v FILES[@] ]] || FILES=('README.rst')

# Parse version and increment accordingly
# validate tag - dne? non-numeric?
 use read to parse to an array?
VERSION="$(git tag | tail -n1 | tr -d 'v')"
MAJOR="$(cut -d'.' -f1 <<< $VERSION)"
MINOR="$(cut -d'.' -f2 <<< $VERSION)"
PATCH="$(cut -d'.' -f3 <<< $VERSION)"

# All other cases for TAG handled in argument validation
case $TAG in 
  major)
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
  ;;
  minor)
    MINOR=$((MINOR + 1))
    PATCH=0
  ;;
  patch) PATCH=$((PATCH + 1))
  ;;
esac

NEW="${MAJOR}.${MINOR}.${PATCH}"
echo $NEW
                
# Modify files
# Use .sed.bak to avoid purging other baks
for x in "${FILES[@]}"; do
  sed -i.sed.bak "s/\\(v\\)${VERSION}/\\1${NEW}/g" "$x" && rm "!$.sed.bak"
done

## Now apply new git tag
#git tag "v${NEW}"
#
## Build new docker images
#push
#
#
