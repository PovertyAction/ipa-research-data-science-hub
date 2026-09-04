Explanation

# Getting started with Quarto

------------------------------------------------------------------------

## Authors

- [Niall Keleher](https://poverty-action.org/people/niall-keleher)

## Last Modified

- September 4, 2026

## License

- [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)

Quarto is a document authoring tool that allows you to create documents using markdown. Quarto is open source (MIT License) software developed and maintained by [Posit](https://posit.co/). It is a powerful tool that allows you to create documents with a variety of formats such as HTML websites, PDF, PowerPoint, Word, and more. Quarto is a great tool for creating documents that are easy to read and share.

The following video provides a quick introduction to Quarto:

# An error occurred.

Unable to execute JavaScript.

## How to install Quarto?

## Windows

``` bash
# Install Quarto
winget install Posit.Quarto
```

## MacOS

``` bash
# Install Quarto
brew install --cask quarto
```

## Linux

To install Quarto on Linux, see <https://quarto.org/docs/get-started/>

## Using Quarto

We recommend using the Quarto Extension for Visual Studio Code. You can install the extension by searching for “Quarto” in the Extensions view (`Ctrl+Shift+X`). Alternatively, you can install the extension from the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/items?itemName=quarto.quarto).

If you use Jupyter Lab or RStudio, Quarto works directly with those tools as well.

The best place to start for learning how to use Quarto is Quarto’s tutorial, [Hello, Quarto](https://quarto.org/docs/get-started/hello).

As an example, this repository uses Quarto to build the handbook.

In the root of the git repository, there is a `_quarto.yml` file that contains the metadata used to compile the handbook. Components of the handbook are written in Markdown, either standard Markdown (`.md`) or Quarto Markdown (`.qmd`). The benefit of standard markdown is that it is more portable and works with standard Markdown editors (e.g. GitHub), while Quarto markdown allows for computations that are embedded in the document. If you want more advanced formatting or computations, `.qmd` may be a preferable choice. The [Quarto Documentation](https://quarto.org/docs/guide/) provides helpful guides on how to use Markdown as well as the added features that Quarto Markdown offers.

For an example of how to use Quarto within common academic and research workflows, see:

# An error occurred.

Unable to execute JavaScript.

## Learning Resources

- Tutorials:
  - [Hello, Quarto](https://quarto.org/docs/get-started/hello/vscode.html)
  - [Computations](https://quarto.org/docs/get-started/computations/vscode.html)
  - [Authoring](https://quarto.org/docs/get-started/authoring/vscode.html)
- [Quarto Documentation](https://quarto.org/docs/guide/)
- [Quarto Gallery of Examples](https://quarto.org/docs/gallery/)

Back to top
