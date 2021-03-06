include $(TOPDIR)/rules.mk

PKG_NAME:=vlmcsd
PKG_VERSION=2016-10-25_svn1099
PKG_RELEASE:=1

PKG_MAINTAINER:=paradislover <wxu1986@gmail.com>
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/paradislover/vlmcsd.git
PKG_SOURCE_VERSION:=642feecb86ad17aa53e9771bdc588ee23d79dc89

PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=$(PKG_SOURCE_SUBDIR).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/vlmcsd
	SECTION:=net
	CATEGORY:=Network
	TITLE:=vlmcsd for OpenWRT
	URL:=http://forums.mydigitallife.info/threads/50234
	DEPENDS:=+libpthread
endef

define Package/vlmcsd/description
	vlmcsd is a KMS Server in C.
endef

define Package/vlmcsd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/vlmcsd $(1)/usr/bin/vlmcsd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/vlmcs $(1)/usr/bin/vlmcs
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/etc/vlmcsd.ini $(1)/etc/vlmcsd.ini
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/etc/config/vlmcsd $(1)/etc/config/vlmcsd
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/vlmcsd $(1)/etc/init.d/vlmcsd
endef

$(eval $(call BuildPackage,vlmcsd))
