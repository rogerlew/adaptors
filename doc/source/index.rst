.. Virtual Watershed Adaptors documentation master file, created by
   sphinx-quickstart on Mon Nov 10 20:59:15 2014.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to the WC-WAVE Adaptors and Model Integration documentation!
====================================================================

Python API for Dynamic Waterhsed Science Modeling
`````````````````````````````````````````````````

This API targets two main tasks of watershed hydrology modeling: data management
and model running and manipulation. The only model currently supported is the
`iSNOBAL <http://cgiss.boisestate.edu/~hpm/software/IPW/man1/isnobal.html>`_ 
model from the `Software Tools for Hydro-Climatic Modeling and Analysis 
Image Processing Workbench (IPW) <http://cgiss.boisestate.edu/~hpm/software/IPW/index.html>`_. 

For data management, this API provides a wrapper of the Virtual Watershed (VW)
The VW is an extension of the 
`GSToRE architecture <http://gstore.unm.edu/docs/index.html>`_ hosted by the
Earth Data Analysis Center at the University of New Mexico. It is a specialized
database for hydrological data. By properly utilizing metadata, we may, for 
example, very intuitively create multiple "model runs", where a given 
hydrological model or coupled hydrological models operate on a set of input 
data. This input data may then be modified, fed to another model run, with 
new outputs, and all this may be stored sanely. 

For a quick look at what's possible with the iSNOBAL interface, see the 
`demonstration experiment of iSNOBAL <isnobal_experiment.html>`_ where we 
modify some observed IPW binary data to increase the temperature, run iSNOBAL
on every set of modified input data, and plot the results with 
pandas/matplotlib.

.. toctree::
   :maxdepth: 2

   watershed
   isnobal
   isnobal_experiment


Quickstart
``````````

This part is very simple and basically consists of three parts: 

1. Clone the repository
2. Install dependencies using ``pip install -r requirements.txt``
3. Copy ``default.conf.template`` to ``default.conf`` and 
   ``src/test/test.conf.template`` to ``src/test/test.conf`` and fill out both
   with your login credentials and correct paths to the XML and JSON metadata
   templates
4. Check that all is well by running the unittests

If you have any questions, please don't hesitate to `email me with questions 
<mailto:maturner@uidaho.edu>`_ or `post an issue on github <https://github.com/tri-state-epscor/adaptors/issues>`_.

Clone repository
----------------

The repository is 
`hosted on github <https://github.com/tri-state-epscor/adaptors>`_. Clone it
like so:

.. code-block:: bash

    git clone https://github.com/tri-state-epscor/adaptors

Install dependencies
--------------------

1. You need `pip <https://pypi.python.org/pypi/pip>`_ installed to complete this
step.

From the root folder of the repository, run

.. code-block:: bash

    pip install -r requirements.txt

2. You also need to `install gdal <https://trac.osgeo.org/gdal/wiki/BuildingOnMac>`_.

3. Make sure you have the latest IPW installed. Download here: 
   `download </downloads/ipw-2.1.0.tar.gz>`_ To install, follow the instructions
   in the ``Install`` text file in the root of the IPW directory.

4. Now you should be able to run the unittests once you finish the next step.

Copy configuration files and edit them appropriately
----------------------------------------------------

The adaptors work their magic by requiring the user to fill out a configuration
file. This is a bit of a hassle at first, but it is worth it. From now on, 
your username, password, virtual watershed URL, and more will be available
and not need to be written in your programs.

To do this, first copy the configuration file templates:

.. code-block:: bash

    $ cp default.conf.template default.conf
    $ cp src/test/test.conf.template src/test/test.conf

Next open ``default.conf`` in your text editor and fill in ``watershedIP``,
``user``, and ``passwd`` fields appropriately. For the two ``template_path``
variables in the two different sections, change ``EDIT-THIS-PATH-TO`` to the
actual path to your ``adaptors`` directory.

Run Unittests
-------------

Finally, run the unittests from the root ``adaptors`` directory like so

.. code-block:: bash

    # -v for verbose
    nosetests -v

If all is well, you will something like this:

.. code-block:: bash

    Check that IPW header is properly re-made ... ok
    Check that the IPW dataframe has been correctly built ... ok
    Check that _bands_to_dtype works as expected ... ok
    Convert an integer to a float using the header information in a Band ... ok
    Test that a DF with floats is correctly translated to a binary string ... ok
    Error when a data val is less than a band maximum? ... ok
    Error when a data val is less than a band minimum? ... ok
    Check that header lines are properly built into a dictionary ... ok
    Test start-to-finish steps of load, modify, and save an IPW file using the IPW class ... ok
    Test that headers are successfully recalculated after data has been ... ok
    Load 5- and 6-band input and em/snow output IPW files and save back to a new file ... ok
    Test that a single metadata JSON string is properly built (FGDC) ... ok
    Test that a single metadata JSON string is properly built (JSON) ... ok
    Test that failed authorization is correctly caught ... /Users/mturner/anaconda/lib/python2.7/site-packages/requests/packages/urllib3/connectionpool.py:730: InsecureRequestWarning: Unverified HTTPS request is being made. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.org/en/latest/security.html (This warning will only appear once by default.)
      InsecureRequestWarning)
    ok
    VW Client properly downloads data ... ok
    VW Client throws error on failed download ... ok
    VW Client properly inserts data ... ok
    VW Client throws error on failed insert ... ok
    VW Client properly uploads data ... ok

    ----------------------------------------------------------------------
    Ran 19 tests in 16.700s

    OK

It's ok if there are more tests as tests are added with new functionality. The
important thing is that the tests run and that they pass (i.e. you see "OK"
as the last line of output.

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

