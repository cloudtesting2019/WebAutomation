from configparser import ConfigParser

def Get_Element_Locator(SectionName, LocatorName):
    config = ConfigParser()
    config.read('../LocatorFile/Locators.cfg')
    return config.get(SectionName,LocatorName)

def Get_Application_Setting(SectionName, SettingName):
    config = ConfigParser()
    config.read('../Setting/Settings.cfg')
    return config.get(SectionName,SettingName)


