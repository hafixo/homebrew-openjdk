# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk14-openj9-jre-large' do
  version '14,36'
  sha256 'ec86223848904f868122a46bc96b21f62d318dee7024ae5f1776d02c4686fbf9'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-14%2B36.1_openj9-0.19.0/OpenJDK14U-jre_x64_mac_openj9_macosXL_14_36_openj9-0.19.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 14 (OpenJ9) (JRE) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK14U-jre_x64_mac_openj9_macosXL_14_36_openj9-0.19.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.14-openj9.jre'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.14-openj9.jre'
end
