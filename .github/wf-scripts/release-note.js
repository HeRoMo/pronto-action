module.exports = async ({github, context, core, latestVersion, nextVersion}) => {
  const releaseNote = await github.rest.repos.generateReleaseNotes({
    owner: context.repo.owner,
    repo: context.repo.repo,
    previous_tag_name: latestVersion,
    tag_name: nextVersion,
    configuration_file_path: '.github/release-note-for-pr.yml',
  });
  core.setOutput('release-note', releaseNote);
};
