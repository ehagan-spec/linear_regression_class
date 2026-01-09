# Contributing to Linear Regression Class

This project is a work in progress. Any suggestions are warmly welcome. As we work through the 
course content, please don't hesitate to report issues, request clarification, or suggestion improvements.

## Here's How to Contribute:

### 1. Report Issues
- Found a typo or error in course materials?
- Encountered a bug in example code?
- Have a question about the content?

**Create an issue** on GitHub describing what you found.

### 2. Suggest Improvements
- Have an idea for a better explanation?
- Know of a great dataset that would illustrate a concept?
- Want to suggest an additional topic?

**Open an issue** with your suggestion.

### 3. Share Examples
- Created an interesting analysis using course techniques?
- Built a useful Shiny app?
- Wrote a helpful vignette?

**Submit a pull request** with your contribution.

## Getting Started

### Fork the Repository

1. Click the "Fork" button at the top of the repository page
2. Clone your fork to your local machine:
```bash
git clone https://github.com/YOUR-USERNAME/linear_regression_class.git
cd linear_regression_class
```

### Set Up Your Environment

1. Install R (version 4.0.0 or higher)
2. Install required packages:
```r
install.packages(c("tidyverse", "broom", "car", "shiny"))
```

### Create a Branch

```bash
git checkout -b my-contribution
```

## Making Changes

### Code Style

Follow the [tidyverse style guide](https://style.tidyverse.org/):

- Try to use `<-` for assignment, not `=`
- Use `snake_case` for variable and function names
- Include spaces around operators: `x + y` not `x+y`
- Limit lines to 80 characters
- Use meaningful variable names

### R Markdown Documents

When editing `.Rmd` files:

- Test that the document knits without errors
- Include `sessionInfo()` at the end
- Use code chunk labels
- Add comments to explain complex code
- Include appropriate citations

### Commit Messages

Write clear commit messages:

```bash
git commit -m "Fix typo in lecture 01 introduction"
git commit -m "Add vignette on handling missing data"
git commit -m "Update README with new installation instructions"
```

## Submitting Changes

### Pull Requests

1. Push your changes to your fork:
```bash
git push origin my-contribution
```

2. Go to the original repository on GitHub
3. Click "New Pull Request"
4. Select your branch
5. Describe your changes clearly
6. Submit the pull request

### Pull Request Guidelines

**Good PR description:**
```
## Changes
- Fixed equation formatting in lecture 04
- Updated code example to use tidyverse syntax
- Added explanation of confidence intervals

## Testing
- Verified that lecture 04 knits to HTML without errors
- Tested code examples in R 4.2.0
```

If you have questions about contributing:

1. Check existing issues to see if it's been answered
2. Review this guide thoroughly
3. Ask in a new issue with the "question" label
4. Contact the course instructor

## Recognition

Contributors will be acknowledged in:
- The repository's contributor list
- Course acknowledgments 
- Individual pull request credits

## License

By contributing to this repository, you agree that your contributions will be licensed under the Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0).

## Additional Resources

- [GitHub Flow Guide](https://guides.github.com/introduction/flow/)
- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)
- [R Packages: Git and GitHub](https://r-pkgs.org/git.html)
- [Tidyverse Style Guide](https://style.tidyverse.org/)

