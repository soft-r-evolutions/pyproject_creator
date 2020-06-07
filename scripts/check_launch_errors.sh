function usage {
    error_code=$1
    echo "Initialize a python project" 
    echo "./pyproject-creator.sh PROJECT_NAME  \"End user ProjectName\" [OPTIONS] [Github_projectspace]"
    echo "With:"
    echo "PROJECT_NAME: your Python project name"
    echo "End user ProjectName: Project name for documentation..."
    echo "OPTIONS can be combined by any seperator except space."
    echo "Option list are: "
    echo "- simple: your module contain a single file."
    echo "- github your module integrate a github workflow."
    echo "- erase: your module integrate a github workflow."
    echo "Github_projectspace: if your module integrate a github workflow specify github project space."
    echo ""
    echo "The new project will be written to projects folder."
    echo "If the output folder already exists the project will exit"
    echo "in error."
    exit ${error_code}
}

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    usage 0
fi

if [ "$#" -lt 2 ]; then
    usage 1
fi
