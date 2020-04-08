[GitHub Learning Lab](https://lab.github.com/docs/about) is a way to learn on GitHub. You can use Learning Lab to 

1. level up your own skills (as a learner), and to 
2. create courses for others (as an author).

This is the general pattern learners and authors follow when using GitHub Learning Lab:

*   An author creates and publishes a Learning Lab course.
*   A learner visits GitHub Learning Lab. They can browse through the course catalog and read about GitHub Learning Lab without signing in.
*   A learner signs into GitHub Learning Lab for the first time, GitHub requests [user-level permissions](https://developer.github.com/apps/building-github-apps/identifying-and-authorizing-users-for-github-apps/#user-level-permissions). The learner authorizes the app.
*   GitHub Learning Lab requests the learner install it on at least one repository, or on their account (all current and future repositories). These installation types are known as `selected` or `all`, respectively.
*   Learner installs the app as requested.
*   A learner registers for a course in GitHub Learning Lab.
*   GitHub Learning Lab creates a repository for the registered course based on a template specified by the course's author.
*   GitHub Learning Lab sets up the newly created repository with any issues, pull requests, and settings specified by the course's author.
*   GitHub Learning Lab shows the learner the course progress page with steps defined by the course's author.
*   Learner clicks on the current step and navigates to the active issue, pull request, or page on GitHub.
*   Learner performs the course's requested action.
*   GitHub Learning Lab receives an event describing the learner's action.
*   If the learner's action is expected, GitHub Learning Lab responds as defined by the course's author. If the learner's action is unexpected, GitHub Learning Lab does not react.
*   GitHub Learning Lab marks the course as complete when the learner completes all expected actions.
