{ lib, stdenv, fetchFromGitLab, autoreconfHook, pkg-config, nettle, gnutls
, libev, protobufc, guile, geoip, libseccomp, gperf, readline
, lz4, libgssglue, ronn, pam, libxcrypt
}:

stdenv.mkDerivation rec {
  pname = "ocserv";
  version = "1.2.0";

  src = fetchFromGitLab {
    owner = "openconnect";
    repo = "ocserv";
    rev = version;
    sha256 = "sha256-EwjP4HKJEPMnn2tnJG7tPgHc49iQQm+V1mKx8CLOSkw=";
  };

  nativeBuildInputs = [ autoreconfHook gperf pkg-config ronn ];
  buildInputs = [ nettle gnutls libev protobufc guile geoip libseccomp readline lz4 libgssglue pam libxcrypt ];

  meta = with lib; {
    homepage = "https://gitlab.com/openconnect/ocserv";
    license = licenses.gpl2Plus;
    description = "OpenConnect VPN server (ocserv), a server for the OpenConnect VPN client";
    maintainers = with maintainers; [ neverbehave ];
  };
}
