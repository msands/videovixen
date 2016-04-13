== Video Vixen

Source code for Video Vixen web application

## Development

### Pull Request Workflow

  1. Create a branch named with a description:
     ```
     git checkout -b add_short_note_to_readme_for_development_workflow
     ```

  2. Add commits tagged with the appropriate Pivotal Tracker story id
     ```
     [#258213]
     ```

     If you are expecting a commit to resolve the issue, tag it like:
     ```
     [Finishes #258213]
     ```

     which will automatically finish the story in Pivotal Tracker.

  3. Push those commits:

     ```
     git push origin add_short_note_to_readme_for_development_workflow
     ```

  4. When story is complete, issue a pull request via the Github UI.
  5. Test your changes! Make sure the app runs and you can interact with the functionality you were working with, make sure the tests all pass, and make sure that you included test code with your changes as needed.
  6. Once you feel that your story is complete, add a comment to the pull request asking for someone to review your changes.
  7. Review comments and address as appropriate in the same pull request, and add a comment asking for someone to review and merge your pull request.
  8. Someone will merge your request, deploy your change, and delete the copy of your branch on Github.
  9. Delete your local copy of the branch:

  ```
  git branch -d add_short_note_to_readme_for_development_workflow
  ```
