
##############################################################
#
# BME280-DRIVER
#
##############################################################

BME280_DRIVER_VERSION = '2ca85071074d8010e42207f0a143dc687cd06002'
BME280_DRIVER_SITE = 'git@github.com:cu-ecen-aeld/final-project-ritikar97.git'
BME280_DRIVER_SITE_METHOD = git
BME280_DRIVER_GIT_SUBMODULES = YES

BME280_DRIVER_MODULE_SUBDIRS = bme280-driver

define BME280_DRIVER_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/measure all
endef


define BME280_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/measure/bme280_measure $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/bme280-driver/bme280_load $(TARGET_DIR)/usr/bin
    $(INSTALL) -m 0755 $(@D)/bme280-driver/bme280_unload $(TARGET_DIR)/usr/bin
endef


$(eval $(kernel-module))
$(eval $(generic-package))
