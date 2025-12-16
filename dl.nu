use std log

const nu_versions = [
  "0.105.1",
  "0.109.1"
]

const dlPackageName = "/tmp/nu502F5896E33.tar.gz"
const dlName = "/tmp/nu502F5896E33"


const os_arch = [
  {oa: "linux-amd64", dlSuffix: "aarch64-unknown-linux-gnu.tar.gz"}
  {oa: "linux-arm64", dlSuffix: "x86_64-unknown-linux-gnu.tar.gz"}
  {oa: "darwin-amd64", dlSuffix: "x86_64-apple-darwin.tar.gz"}
  {oa: "darwin-arm64", dlSuffix: "aarch64-apple-darwin.tar.gz"}
]

def main [] {}



def download_nu [NU_VERSION, os_arch_path,dl_suffix] {
    rm -rf $dlName $dlPackageName
    let dlURL = $"https://github.com/nushell/nushell/releases/download/($NU_VERSION)/nu-($NU_VERSION)-($dl_suffix)"
    print $"Downloading ($dlURL)"
    curl -z $dlPackageName -L $"($dlURL)" -o $dlPackageName
    mkdir $dlName
    tar -xzf $dlPackageName -C $dlName --strip-components=1
    let targetPath = ("cmd/tools/" | path join $os_arch_path  | path join ($NU_VERSION | split row "." | get 1)| path join "nu")
    mkdir ($targetPath | path dirname)
    mv ($dlName | path join "nu") $targetPath
    rm -rf $dlName $dlPackageName
}

def "main dl" [] {
  for arch in $os_arch {
    print $"Downloading for ($arch.oa)...\n"
    print $"Downloading dl.nu for ($arch.dlSuffix)...\n"
    for v in $nu_versions {
      download_nu $v $arch.oa $arch.dlSuffix 
    }
  }
}