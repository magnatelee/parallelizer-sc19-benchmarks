This repository contains benchmark programs used for the paper "A Constraint-Based Approach to Automatic Data Partitioning for Distributed Memory Execution", SC'19.

Each directory has two subdirectories, `Auto` and `Manual`, which store auto-parallelized and hand-parallelized versions, respectively.

The following is the list of benchmark programs and their breif descriptions:

* `Circuit` - Circuit simulation on unstructured circuit graphs

* `MiniAero` - A proxy application solving Navier-Stokes equations for compressible flows on hexahedron meshes

* `PENNANT` - A proxy application for Lagrangian hydrodynamics on 2D meshes

* `Stencil` - A 9-point stencil test on 2D grids

All the build and job scripts can be found in `scripts`. To build benchmark programs correctly, use `scripts/build_*.sh`, which take a build directory as an argument.
