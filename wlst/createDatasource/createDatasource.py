from java.io import FileInputStream

def createDatasource(dsName, dsJNDIName, dsURL, dsTestQuery):
	cd('/')
	cmo.createJDBCSystemResource(dsName)
	cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName)
	cmo.setName(dsName)

	cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDataSourceParams/' + dsName )
	set('JNDINames',jarray.array([String( dsJNDIName )], String))

	cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName )
	cmo.setUrl(dsURL)
	cmo.setDriverName( "oracle.jdbc.xa.client.OracleXADataSource" )
	cmo.setPassword(dsPassword)

	cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCConnectionPoolParams/' + dsName )
	cmo.setTestTableName(dsTestQuery)
	cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName )
	cmo.createProperty('user')

	cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDriverParams/' + dsName + '/Properties/' + dsName + '/Properties/user')
	cmo.setValue(dsUserName)

	cd('/JDBCSystemResources/' + dsName + '/JDBCResource/' + dsName + '/JDBCDataSourceParams/' + dsName )
	cmo.setGlobalTransactionsProtocol('OnePhaseCommit')

	cd('/SystemResources/' + dsName )
	set('Targets',jarray.array([ObjectName('com.bea:Name=' + datasourceTarget + ',Type=Server')], ObjectName))

	print('Created datasource : '+dsName)

	
propInputStream = FileInputStream("createDatasource.properties")
configProps = Properties()
configProps.load(propInputStream)

adminURL=configProps.get("admin.url")
adminUserName=configProps.get("admin.userName")
adminPassword=configProps.get("admin.password")

dsURL=configProps.get("datasource.url")
dsUserName=configProps.get("datasource.username")
dsPassword=configProps.get("datasource.password")

connect(adminUserName, adminPassword, adminURL)
edit()
startEdit()
createDatasource(configProps.get("datasource.name"), configProps.get("datasource.jndiname"), dsURL, configProps.get("datasource.test.query"))
save()
activate()


