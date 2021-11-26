#### REGEX EXAMPLE

```
if [[ "$RELEASE_TRAIN" =~ ^master-(7|8)?$ ]]; then
    SCM_BRANCH=master
elif [[ "$RELEASE_TRAIN" =~ ^release-(7|8)?$ ]]; then
    SCM_BRANCH=release
fi
```

What does =~ mean?   
It's a regular expression match operator.
From Bash man page:
An additional binary operator, `=~`, is available, with the same precedence as `==` and `!=`.  When it is used, the string to the right of the operator is considered an extended regular 
expression and matched accordingly (as in regex(3)). The return value is `0` if the string matches the pattern, and `1` otherwise.  


