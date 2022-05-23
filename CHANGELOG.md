# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- OCCM now only run on control-plane nodes
- Bump `VolumeSnapshotClass` version to v1 since v1beta1 is deprecated.
- Add default annotation to VolumeSnapshotClass.

## [0.5.1] - 2022-04-29

### Changed

- Moved snapshop class to top level values file

## [0.5.0] - 2022-04-25

### Added

- Add default VolumeSnapshotClass for Cinder CSI.

## [0.4.0] - 2022-04-01

### Changed

- Clean up root values.yaml file.
- Update `openstack-cloud-controller-manager` to v1.23.1.

## [0.3.0] - 2022-03-28

### Added 

- Enable snapshotter by default.

## [0.2.2] - 2022-02-14

## [0.2.1] - 2022-02-14

### Changed

- Update helm charts with latest upstream versions

## [0.2.0] - 2022-01-26

### Changed

- Set the default reclaim policy to delete.
- Set default to create Loadbalancer health monitors 

## [0.1.1] - 2022-01-04

### Added

- Add toleration for `node-role.kubernetes.io/master="":NoSchedule` taint (default CAPI CP taint).

## [0.1.0] - 2021-12-03

[Unreleased]: https://github.com/giantswarm/cloud-provider-openstack-app/compare/v0.5.1...HEAD
[0.5.1]: https://github.com/giantswarm/cloud-provider-openstack-app/compare/v0.5.0...v0.5.1
[0.5.0]: https://github.com/giantswarm/cloud-provider-openstack-app/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/giantswarm/cloud-provider-openstack-app/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/giantswarm/cloud-provider-openstack-app/compare/v0.2.2...v0.3.0
[0.2.2]: https://github.com/giantswarm/cloud-provider-openstack-app/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/giantswarm/cloud-provider-openstack-app/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/giantswarm/cloud-provider-openstack-app/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/giantswarm/cloud-provider-openstack-app/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/giantswarm/cloud-provider-openstack-app/releases/tag/v0.1.0
