Python library template
================================================================================

A python library template with a few pre-configured tools.
For the minimimum required changes, copy the folder structure,
edit ``setup.py`` for the name of the library,
change the ``mylib/`` folder to the name of the new library and it's ready.
Preconfigured dev tools:

- Documentation with `Sphinx <https://www.sphinx-doc.org/>`_.
- `Keep a changelog <https://keepachangelog.com/>`_
  for `Semantic versioning <https://semver.org/>`_.
- Testing with `PyTest <https://github.com/pytest-dev/pytest/>`_
- Autoformatting with `Black <https://github.com/psf/black>`_ and
  `isort <https://github.com/timothycrosley/isort>`_.
- Code linting with `Flake8 <https://github.com/pycqa/flake8/>`_.
- Documentation linting with
  `Darglint <https://github.com/terrencepreilly/darglint>`_,
  and `pydocstyle <https://github.com/PyCQA/pydocstyle/>`_.
- Some automation with
  `make <https://www.gnu.org/software/make/>`_
  and `git hooks <https://githooks.com/>`_.


Makefile
--------------------------------------------------------------------------------

To manage installation and dev tools,
the template has a ``Makefile``.
(See `Make for Windows <http://gnuwin32.sourceforge.net/packages/make.htm>`_)

.. code-block:: console

  > make help
  install        Install the library and dependencies
  install-dev    Install in editable mode with dev. dependencies
  test           Run pytest
  format         Run formatting tools
  lint           Run linters and formatting tools (no edits)
  docs           Build the docs

Changelog
--------------------------------------------------------------------------------

Document changes in ``changelog.md``,
following `Keep a changelog <https://keepachangelog.com/>`_
and `Semantic versioning <https://semver.org/>`_.

Documentation
--------------------------------------------------------------------------------

The documentation is generated with `Sphinx <https://www.sphinx-doc.org/>`_,
configured in ``docs_src/conf.py``, and uses
`Sphinx-gallery <https://github.com/sphinx-gallery/sphinx-gallery>`_
to generate notebook-style examples from source code in ``examples/``.

The source of the is in ``docs_src/``
and gets compiled to ``docs/``
with ``make docs``
for easy publication with `Github pages <https://pages.github.com/>`_.
If you are not using Github pages, you should ``.gitignore`` the
documentation output.

A `ReadTheDocs <http://readthedocs.io/>`_ config file is also present,
in ``.readthedocs.yml``, if you wish to publish there.
RTD uses its theme by default, whereas a local run of
Sphinx needs to be told to use the ReadTheDocs theme.
To publish on RTD, you need to comment out the following line
in ``docs_src/conf.py``

.. code-block:: console

  html_theme = "sphinx_rtd_theme"


Testing
--------------------------------------------------------------------------------

`PyTest <https://github.com/pytest-dev/pytest/>`_
is configured to run the tests in ``test/``
using ``make test``.


Autoformatting
--------------------------------------------------------------------------------

The template comes with a configuration of
`Black <https://github.com/psf/black>`_ (``black.toml``) compatible with
`isort <https://github.com/timothycrosley/isort>`_ (``.isort.cfg``).

Use ``make format`` to format the source, or install one of the
`editor integration <https://black.readthedocs.io/en/stable/editor_integration.html>`_
to have automatic formatting.

Linting
--------------------------------------------------------------------------------

Code linting with `Flake8 <https://github.com/pycqa/flake8/>`_ (``.flake8``),
which includes
`PyFlakes <https://github.com/PyCQA/pyflakes>`_ (linting)
`McCabe <https://github.com/pycqa/mccabe>`_ (complexity)
and `pycodestyle <https://github.com/PyCQA/pycodestyle/>`_ (style).
Documentation linting with
`Darglint <https://github.com/terrencepreilly/darglint>`_ (linting)
`pydocstyle <https://github.com/PyCQA/pydocstyle/>`_ (style).

Run with ``make lint``.
``make install-dev`` installs a git hook to lint before commits.