### Desarrollar un sistema para entrada y salida de empleados.

##### Requerimientos funcionales:

- [x] Inicio de sesión de administrador de la empresa
- [x] Inicio de sesión de empleado
- [x] El administrador puede marcar la entrada y salida de sus empleados
- [x] El administrador gestione los reportes de entrada y salida de sus empleados
- [x] El administrador gestione la información de empleados
- [x] El empleado revise su reporte de entrada y salida, que incluya el empleado que mas horas trabajo y el que menos horas trabajo

##### Consideraciones:
- [ ] Backend en Ruby on Rails v5.1.3 y debe existir un cliente frontend que pueda consumir el API 
- [ ] API debe estar documentado
- [x] Usar PostgreSQL
- [ ] Aplicar Unit testing o testing funcional
----

### Requirements

> ruby -v

		ruby 2.6.1

> rails -v

		Rails 5.1.3

##### Create database

> rails db:create

##### Run migrations

> rails db:migrate

##### Run seeds

> rails db:seed

----

## [Heroku example](https://nomina-runa.herokuapp.com):
`<Heroku example>` : <https://nomina-runa.herokuapp.com>

#### Login access

###### Admin role test
| Email | Password                    |
| ------------- | ------------------------------ |
| *admin@admin.com*      | **123456**|

###### Employee role test
| Email | Password                    |
| ------------- | ------------------------------ |
| *employee@employee.com*      | **123456**|

## Screenshots Admin role permissions
![role-admin](https://user-images.githubusercontent.com/346231/58352443-258cea00-7e31-11e9-9e89-24c56cf47374.png)

## Screenshots Employee role permissions
![role-employee](https://user-images.githubusercontent.com/346231/58352444-258cea00-7e31-11e9-8cb4-04e0c1079462.png)
