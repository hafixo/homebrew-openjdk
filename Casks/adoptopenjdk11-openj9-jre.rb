# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk11-openj9-jre' do
  version '11.0.7,10.2'
  sha256 '9f1f7e29f7040fd5a12c73aa4c18148b61a175a2c48e968fecf700b396c842fe'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.7%2B10.2_openj9-0.20.0/OpenJDK11U-jre_x64_mac_openj9_11.0.7_10_openj9-0.20.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9) (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_openj9_11.0.7_10_openj9-0.20.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.11-openj9.jre'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.11-openj9.jre'
end
