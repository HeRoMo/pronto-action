module.exports = async ({github, context, core, level}) => {
  const release = await github.rest.repos.getLatestRelease({
    owner: context.repo.owner,
    repo: context.repo.repo,
  });
  const latestVersion = release.data.tag_name;
  core.setOutput('latest-version', latestVersion);
  const versionGroups = latestVersion.match(/v(?<major>[0-9]+)\.(?<minor>[0-9]+)\.(?<patch>[0-9]+)/).groups;
  let major = Number(versionGroups.major);
  let minor = Number(versionGroups.minor);
  let patch = Number(versionGroups.patch);
  if (level == 'major') {
    major++;
    minor = 0;
    patch = 0;
  } else if (level == 'minor') {
    minor++;
    patch = 0;
  } else if (level == 'patch') {
    patch++
  } else {
    throw 'invalid level'
  }
  const nextVersion = `v${major}.${minor}.${patch}`;
  core.setOutput('next-version', nextVersion);
  const nextVersions = { major, minor, patch, nextVersion }
  return nextVersions
};
