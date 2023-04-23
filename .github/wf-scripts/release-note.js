module.exports = async ({github, context, core, latestVersion, nextVersion}) => {
  const releaseNote = await github.rest.repos.generateReleaseNotes({
    owner: context.repo.owner,
    repo: context.repo.repo,
    previous_tag_name: latestVersion,
    tag_name: nextVersion,
  });
  core.setOutput('release-note', releaseNote);
};
