# Enforcing style guides with Rubocop

This is the workshop portion of the Winnipeg Ruby user group's October meetup.
https://www.meetup.com/winnipegrb/events/296601492/

## Setup

If you already have ruby 3.2.2 setup, you can skip this step.

1. Install Visual Studio Code (https://code.visualstudio.com/):
```
> brew install --cask visual-studio-code
```

2. Install Docker Desktop (https://www.docker.com/products/docker-desktop/):
```
> brew install --cask docker
```

3. Clone this repo and open it in vscode:
- `git clone https://github.com/gmcgibbon/gannon.io.git`
- `cd gannon.io`
- `git checkout rubocop_workshop`
- `code .`

4. Install the Dev Containers extension:
```
> code --install-extension ms-vscode-remote.remote-containers
```

5. Open the porject in the dev container:
- Type `Cmd + P` / `View` -> `Command Palette`
- Type "> Dev Containers: Open Folder in Container..."
- Hit `Return` / Click the option from the dropdown
- Click `Open` from the file selection window

6. Open a terminal with ```Ctrl + Shift + ` ``` and run setup:
```
> bin/setup
```

You're ready to go!

## Custom cop

Let's make a cop to deprecate usage of the constant `ActiveSupport::Deprecation`. Calling deprecations from this singelton is deprecated in Rails 7.1.

1. Create a file in `lib` called `cops/active_support_deprecation_usage.rb`.

2. Add a class that detects method calls of `ActiveSupport::Deprecation` (hint: use https://nodepattern.herokuapp.com/).

3. Add the `rubocop-minitest` gem to the project so that we can test our new cop.

4. Create a file in `test` called `cops/active_support_deprecation_usage_test.rb`.

5. Write tests that detect an offense for the following scenarios (hint: use `assert_offense`):
- ```ruby
  ::ActiveSupport::Deprecation.warn("deprecated")
  ```
- ```ruby
  ActiveSupport::Deprecation.debug
  ```
- ```ruby
  ActiveSupport::Deprecation.behavior
  ```

6. Write tests that detect no offenses for the following scenarios (hint: use `assert_no_offenses`):
- ```ruby
  ActiveSupport::Deprecation
  ```
- ```ruby
  Other::ActiveSupport::Deprecation
  ```
- ```ruby
  ActiveSupport::Deprecation.to_json
  ```

7. Require and enable the the new cop in the project's `rubocop.yml` file. 

## Rubocop extensions

1. Add the `rubocop-minitest` gem to the project if you haven't already.

2. In the project's `rubocop.yml` file, require `rubocop-rails`` and `rubocop-minitest`.

3. Review and fix the violations (hint: disable `Minitest/MultipleAssertions` and `Rails/OutputSafety`).

Hooray! That's all for the workshop. Thanks for trying it. If you're having any issues, please see the solution branch: https://github.com/gmcgibbon/gannon.io/tree/rubocop_workshop_soln.
