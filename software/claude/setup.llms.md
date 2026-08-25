# Setting Up Claude Code

How to install Claude Code and start your first session, whether you work in the terminal and VS Code or prefer the desktop app. Covers what you need before you start and the install steps for each path, and points to the official documentation for the details Anthropic maintains.

------------------------------------------------------------------------

## Authors

- [Juan Felipe García Rodríguez](https://poverty-action.org/people/juan-felipe-garcia-rodriguez)
- [Diego Quintero Mogollón](https://poverty-action.org/people/diego-quintero-mogollon)

## Last Modified

- August 25, 2026

## License

- [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)

> **NOTE:**
>
> This content is adapted from the [Claude Code guide for IPA Colombia](https://github.com/juanfegarIPA/claude-code-ipa-colombia) by Juan Felipe García Rodríguez and Diego Quintero Mogollón, used under the [MIT License](https://github.com/juanfegarIPA/claude-code-ipa-colombia/blob/main/LICENSE).

> **TIP:**
>
> - Claude Code needs a paid Claude plan; the free claude.ai plan does not include it.
> - Choose one path: the **terminal and VS Code** if you write code, or the **desktop app** if you prefer a visual interface. Both do the same work and can be installed side by side.
> - To install Git and VS Code, follow the Hub’s existing setup guide rather than duplicating those steps here.

## Before you start

Claude Code requires a paid Claude plan, such as Pro, Max, Team, or Enterprise. The free claude.ai plan does not include it. If you plan to work in the terminal, you also need Git and a code editor.

> **NOTE:**
>
> IPA staff are covered by the organization’s Enterprise license. Sign in at [claude.ai](https://claude.ai) with your IPA email; if you land in the IPA workspace, you are covered. If not, contact <support@poverty-action.org> to request a seat.
>
> To install Git and VS Code, follow the Hub’s [Setup Instructions](../../software/git/getting-started.llms.md), which cover both for Windows, Mac, and Linux. On Windows, that guide installs Git for Windows, which Claude Code uses for its Bash tool.

## Choose how you’ll work

There are two ways to run Claude Code. Both are covered by the same plan, do the same work, and can be installed side by side, so you can change your mind later.

- **Terminal and VS Code** suits anyone who writes code or works in version-controlled projects.
- **Desktop app** suits anyone who prefers a visual interface and does not want to use a terminal.

## Terminal and VS Code

Install Claude Code with the native installer, which keeps itself up to date.

On Windows, open PowerShell and run:

``` powershell
irm https://claude.ai/install.ps1 | iex
```

On Mac or Linux, open a terminal and run:

``` bash
curl -fsSL https://claude.ai/install.sh | bash
```

Confirm the install in a new terminal:

``` bash
claude --version
```

To work with Claude Code beside your files, open VS Code, go to the Extensions view, and install **Claude Code**, published by Anthropic.

Then open your project and start a session:

``` bash
cd path/to/your/project
claude
```

The first time you run `claude`, it asks you to sign in. Use the same account you checked above; you do not need an API key.

For a guided first session, see Anthropic’s [quickstart](https://code.claude.com/docs/en/quickstart).

## Desktop app

1.  Download the app from [claude.ai/download](https://claude.ai/download), available for Windows and Mac.
2.  Install it with the default options and open it.
3.  Sign in with the same account you checked above.
4.  Select the **Code** tab, choose **Local**, and select the folder you want to work in.

For a tour of the desktop app, see Anthropic’s [desktop quickstart](https://code.claude.com/docs/en/desktop-quickstart).

> **TIP:**
>
> Run `claude doctor` in the terminal for a check of your setup, or see Anthropic’s [installation troubleshooting](https://code.claude.com/docs/en/troubleshoot-install). IPA staff can write to <support@poverty-action.org>.

## Additional Resources

Anthropic. “Advanced Setup.” Claude Code Documentation. <https://code.claude.com/docs/en/setup>.

Anthropic. “Quickstart.” Claude Code Documentation. <https://code.claude.com/docs/en/quickstart>.

Innovations for Poverty Action. “Setup Instructions.” IPA Research and Data Science Hub. [Setup Instructions](../../software/git/getting-started.llms.md).

Back to top
