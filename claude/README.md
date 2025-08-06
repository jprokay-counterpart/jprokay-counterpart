# Claude Files

## Prerequisites

These custom commands rely on additional CLI tools to work:

- [GitHub CLI](https://cli.github.com/)
- [JQ](https://jqlang.org/)

I recommend download the [html2markdown](https://github.com/JohannesKaufmann/html-to-markdown) to make your own resource files/

```bash
curl --no-progress-meter https://mywebsite.com | html2markdown >> mymarkdown.md
```

## Using Them

Copy the commands and resources directories to your `~/.claude` directory if
you want to be able to use the commands from any instance of Claude.

## Reading

[Custom Slash Commands](https://docs.anthropic.com/en/docs/claude-code/slash-commands#custom-slash-commands)

