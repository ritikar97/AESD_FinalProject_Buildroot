
##############################################################
#
# BME280-DRIVER
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
BME280_DRIVER_VERSION = 'ca9fb5b18c239591d60616d5c923db13ea1c56d9'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
BME280_DRIVER_SITE = 'git@github.com:cu-ecen-aeld/final-project-ritikar97.git'
BME280_DRIVER_SITE_METHOD = git
BME280_DRIVER_GIT_SUBMODULES = YES

BME280_DRIVER_MODULE_SUBDIRS = bme280-driver

define BME280_DRIVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/measure all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/mqtt_sub all
endef


# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define BME280_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/measure/bme280_measure $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/bme280-driver/bme280_load $(TARGET_DIR)/usr/bin
    $(INSTALL) -m 0755 $(@D)/bme280-driver/bme280_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/mqtt_sub/mqtt_sub_rpi $(TARGET_DIR)/usr/bin
endef


$(eval $(kernel-module))
$(eval $(generic-package))
