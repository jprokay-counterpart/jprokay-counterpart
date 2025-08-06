[Skip to main content](#__docusaurus_skipToContent_fallback)

[![Playwright logo](/img/playwright-logo.svg)![Playwright logo](/img/playwright-logo.svg)  
\
**Playwright**](/)[Docs](/docs/intro)[API](/docs/api/class-playwright)

[Node.js](#)

- [Node.js](/docs/pom)
- [Python](/python/docs/pom)
- [Java](/java/docs/pom)
- [.NET](/dotnet/docs/pom)

[Community](/community/welcome)

[](https://github.com/microsoft/playwright)[](https://aka.ms/playwright/discord)

Search

- [Getting Started](/docs/intro)
  
  - [Installation](/docs/intro)
  - [Writing tests](/docs/writing-tests)
  - [Generating tests](/docs/codegen-intro)
  - [Running and debugging tests](/docs/running-tests)
  - [Trace viewer](/docs/trace-viewer-intro)
  - [Setting up CI](/docs/ci-intro)
- [Getting started - VS Code](/docs/getting-started-vscode)
- [Release notes](/docs/release-notes)
- [Canary releases](/docs/canary-releases)
- [Playwright Test](/docs/test-configuration)
  
  - [Test configuration](/docs/test-configuration)
  - [Test use options](/docs/test-use-options)
  - [Annotations](/docs/test-annotations)
  - [Command line](/docs/test-cli)
  - [Emulation](/docs/emulation)
  - [Fixtures](/docs/test-fixtures)
  - [Global setup and teardown](/docs/test-global-setup-teardown)
  - [Parallelism](/docs/test-parallel)
  - [Parameterize tests](/docs/test-parameterize)
  - [Projects](/docs/test-projects)
  - [Reporters](/docs/test-reporters)
  - [Retries](/docs/test-retries)
  - [Sharding](/docs/test-sharding)
  - [Timeouts](/docs/test-timeouts)
  - [TypeScript](/docs/test-typescript)
  - [UI Mode](/docs/test-ui-mode)
  - [Web server](/docs/test-webserver)
- [Guides](/docs/library)
  
  - [Library](/docs/library)
  - [Accessibility testing](/docs/accessibility-testing)
  - [Actions](/docs/input)
  - [Assertions](/docs/test-assertions)
  - [API testing](/docs/api-testing)
  - [Authentication](/docs/auth)
  - [Auto-waiting](/docs/actionability)
  - [Best Practices](/docs/best-practices)
  - [Browsers](/docs/browsers)
  - [Chrome extensions](/docs/chrome-extensions)
  - [Clock](/docs/clock)
  - [Components (experimental)](/docs/test-components)
  - [Debugging Tests](/docs/debug)
  - [Dialogs](/docs/dialogs)
  - [Downloads](/docs/downloads)
  - [Evaluating JavaScript](/docs/evaluating)
  - [Events](/docs/events)
  - [Extensibility](/docs/extensibility)
  - [Frames](/docs/frames)
  - [Handles](/docs/handles)
  - [Isolation](/docs/browser-contexts)
  - [Locators](/docs/locators)
  - [Mock APIs](/docs/mock)
  - [Mock browser APIs](/docs/mock-browser-apis)
  - [Navigations](/docs/navigations)
  - [Network](/docs/network)
  - [Other locators](/docs/other-locators)
  - [Pages](/docs/pages)
  - [Page object models](/docs/pom)
  - [Screenshots](/docs/screenshots)
  - [Snapshot testing](/docs/aria-snapshots)
  - [Test generator](/docs/codegen)
  - [Touch events (legacy)](/docs/touch-events)
  - [Trace viewer](/docs/trace-viewer)
  - [Videos](/docs/videos)
  - [Visual comparisons](/docs/test-snapshots)
  - [WebView2](/docs/webview2)
- [Migration](/docs/protractor)
- [Integrations](/docs/docker)
- [Supported languages](/docs/languages)

<!--THE END-->

- [](/)
- Guides
- Page object models

On this page

# Page object models

## Introduction[​](#introduction "Direct link to Introduction")

Large test suites can be structured to optimize ease of authoring and maintenance. Page object models are one such approach to structure your test suite.

A page object represents a part of your web application. An e-commerce web application might have a home page, a listings page and a checkout page. Each of them can be represented by page object models.

Page objects **simplify authoring** by creating a higher-level API which suits your application and **simplify maintenance** by capturing element selectors in one place and create reusable code to avoid repetition.

## Implementation[​](#implementation "Direct link to Implementation")

We will create a `PlaywrightDevPage` helper class to encapsulate common operations on the `playwright.dev` page. Internally, it will use the `page` object.

- Test
- Library

playwright-dev-page.ts

```js
import { expect, type Locator, type Page } from '@playwright/test';

export class PlaywrightDevPage {
  readonly page: Page;
  readonly getStartedLink: Locator;
  readonly gettingStartedHeader: Locator;
  readonly pomLink: Locator;
  readonly tocList: Locator;

  constructor(page: Page) {
    this.page = page;
    this.getStartedLink = page.locator('a', { hasText: 'Get started' });
    this.gettingStartedHeader = page.locator('h1', { hasText: 'Installation' });
    this.pomLink = page.locator('li', {
      hasText: 'Guides',
    }).locator('a', {
      hasText: 'Page Object Model',
    });
    this.tocList = page.locator('article div.markdown ul > li > a');
  }

  async goto() {
    await this.page.goto('https://playwright.dev');
  }

  async getStarted() {
    await this.getStartedLink.first().click();
    await expect(this.gettingStartedHeader).toBeVisible();
  }

  async pageObjectModel() {
    await this.getStarted();
    await this.pomLink.click();
  }
}
```

models/PlaywrightDevPage.js

```js
class PlaywrightDevPage {
  /**
   * @param {import('playwright').Page} page
   */
  constructor(page) {
    this.page = page;
    this.getStartedLink = page.locator('a', { hasText: 'Get started' });
    this.gettingStartedHeader = page.locator('h1', { hasText: 'Installation' });
    this.pomLink = page.locator('li', {
      hasText: 'Playwright Test',
    }).locator('a', {
      hasText: 'Page Object Model',
    });
    this.tocList = page.locator('article div.markdown ul > li > a');
  }
  async getStarted() {
    await this.getStartedLink.first().click();
    await expect(this.gettingStartedHeader).toBeVisible();
  }

  async pageObjectModel() {
    await this.getStarted();
    await this.pomLink.click();
  }
}
module.exports = { PlaywrightDevPage };
```

Now we can use the `PlaywrightDevPage` class in our tests.

- Test
- Library

example.spec.ts

```js
import { test, expect } from '@playwright/test';
import { PlaywrightDevPage } from './playwright-dev-page';

test('getting started should contain table of contents', async ({ page }) => {
  const playwrightDev = new PlaywrightDevPage(page);
  await playwrightDev.goto();
  await playwrightDev.getStarted();
  await expect(playwrightDev.tocList).toHaveText([
    `How to install Playwright`,
    `What's Installed`,
    `How to run the example test`,
    `How to open the HTML test report`,
    `Write tests using web first assertions, page fixtures and locators`,
    `Run single test, multiple tests, headed mode`,
    `Generate tests with Codegen`,
    `See a trace of your tests`
  ]);
});

test('should show Page Object Model article', async ({ page }) => {
  const playwrightDev = new PlaywrightDevPage(page);
  await playwrightDev.goto();
  await playwrightDev.pageObjectModel();
  await expect(page.locator('article')).toContainText('Page Object Model is a common pattern');
});
```

example.spec.js

```js
const { PlaywrightDevPage } = require('./playwright-dev-page');

// In the test
const page = await browser.newPage();
await playwrightDev.goto();
await playwrightDev.getStarted();
await expect(playwrightDev.tocList).toHaveText([
  `How to install Playwright`,
  `What's Installed`,
  `How to run the example test`,
  `How to open the HTML test report`,
  `Write tests using web first assertions, page fixtures and locators`,
  `Run single test, multiple tests, headed mode`,
  `Generate tests with Codegen`,
  `See a trace of your tests`
]);
```

[Previous  
\
Pages](/docs/pages)

[Next  
\
Screenshots](/docs/screenshots)

- [Introduction](#introduction)
- [Implementation](#implementation)

Learn

- [Getting started](/docs/intro)
- [Playwright Training](https://learn.microsoft.com/en-us/training/modules/build-with-playwright/)
- [Learn Videos](/community/learn-videos)
- [Feature Videos](/community/feature-videos)

Community

- [Stack Overflow](https://stackoverflow.com/questions/tagged/playwright)
- [Discord](https://aka.ms/playwright/discord)
- [Twitter](https://twitter.com/playwrightweb)
- [LinkedIn](https://www.linkedin.com/company/playwrightweb)

More

- [GitHub](https://github.com/microsoft/playwright)
- [YouTube](https://www.youtube.com/channel/UC46Zj8pDH5tDosqm1gd7WTg)
- [Blog](https://dev.to/playwright)
- [Ambassadors](/community/ambassadors)

Copyright © 2025 Microsoft
