/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2016                    */
/* Created on:     19/01/2022 9:13:14                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CAUSA') and o.name = 'FK_CAUSA_RELATIONS_DIFUNTO')
alter table CAUSA
   drop constraint FK_CAUSA_RELATIONS_DIFUNTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DIFUNTO') and o.name = 'FK_DIFUNTO_RELATIONS_FAMILIAR')
alter table DIFUNTO
   drop constraint FK_DIFUNTO_RELATIONS_FAMILIAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EMPLEADO') and o.name = 'FK_EMPLEADO_RELATIONS_CADENA_F')
alter table EMPLEADO
   drop constraint FK_EMPLEADO_RELATIONS_CADENA_F
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EMPLEADO') and o.name = 'FK_EMPLEADO_RELATIONS_TIPO_EMP')
alter table EMPLEADO
   drop constraint FK_EMPLEADO_RELATIONS_TIPO_EMP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('INSUMO') and o.name = 'FK_INSUMO_RELATIONS_SALA_VEL')
alter table INSUMO
   drop constraint FK_INSUMO_RELATIONS_SALA_VEL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PROFESIONAL') and o.name = 'FK_PROFESIO_RELATIONS_CADENA_F')
alter table PROFESIONAL
   drop constraint FK_PROFESIO_RELATIONS_CADENA_F
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PROFESIONAL') and o.name = 'FK_PROFESIO_RELATIONS_TIPO_PRO')
alter table PROFESIONAL
   drop constraint FK_PROFESIO_RELATIONS_TIPO_PRO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SALA_VELATORIO') and o.name = 'FK_SALA_VEL_RELATIONS_EMPLEADO')
alter table SALA_VELATORIO
   drop constraint FK_SALA_VEL_RELATIONS_EMPLEADO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SALA_VELATORIO') and o.name = 'FK_SALA_VEL_RELATIONS_CADENA_F')
alter table SALA_VELATORIO
   drop constraint FK_SALA_VEL_RELATIONS_CADENA_F
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VENTA') and o.name = 'FK_VENTA_RELATIONS_FAMILIAR')
alter table VENTA
   drop constraint FK_VENTA_RELATIONS_FAMILIAR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VENTA') and o.name = 'FK_VENTA_RELATIONS_SERVICIO')
alter table VENTA
   drop constraint FK_VENTA_RELATIONS_SERVICIO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VENTA') and o.name = 'FK_VENTA_RELATIONS_SALA_VEL')
alter table VENTA
   drop constraint FK_VENTA_RELATIONS_SALA_VEL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CADENA_FUNERARIA')
            and   type = 'U')
   drop table CADENA_FUNERARIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CAUSA')
            and   name  = 'RELATIONSHIP_15_FK'
            and   indid > 0
            and   indid < 255)
   drop index CAUSA.RELATIONSHIP_15_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CAUSA')
            and   type = 'U')
   drop table CAUSA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DIFUNTO')
            and   name  = 'RELATIONSHIP_16_FK'
            and   indid > 0
            and   indid < 255)
   drop index DIFUNTO.RELATIONSHIP_16_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DIFUNTO')
            and   type = 'U')
   drop table DIFUNTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EMPLEADO')
            and   name  = 'RELATIONSHIP_23_FK'
            and   indid > 0
            and   indid < 255)
   drop index EMPLEADO.RELATIONSHIP_23_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EMPLEADO')
            and   name  = 'RELATIONSHIP_18_FK'
            and   indid > 0
            and   indid < 255)
   drop index EMPLEADO.RELATIONSHIP_18_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPLEADO')
            and   type = 'U')
   drop table EMPLEADO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FAMILIAR')
            and   type = 'U')
   drop table FAMILIAR
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('INSUMO')
            and   name  = 'RELATIONSHIP_13_FK'
            and   indid > 0
            and   indid < 255)
   drop index INSUMO.RELATIONSHIP_13_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('INSUMO')
            and   type = 'U')
   drop table INSUMO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROFESIONAL')
            and   name  = 'RELATIONSHIP_21_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROFESIONAL.RELATIONSHIP_21_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROFESIONAL')
            and   name  = 'RELATIONSHIP_20_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROFESIONAL.RELATIONSHIP_20_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROFESIONAL')
            and   type = 'U')
   drop table PROFESIONAL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SALA_VELATORIO')
            and   name  = 'RELATIONSHIP_19_FK'
            and   indid > 0
            and   indid < 255)
   drop index SALA_VELATORIO.RELATIONSHIP_19_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SALA_VELATORIO')
            and   name  = 'RELATIONSHIP_17_FK'
            and   indid > 0
            and   indid < 255)
   drop index SALA_VELATORIO.RELATIONSHIP_17_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SALA_VELATORIO')
            and   type = 'U')
   drop table SALA_VELATORIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SERVICIO')
            and   type = 'U')
   drop table SERVICIO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIPO_EMPLEADO')
            and   type = 'U')
   drop table TIPO_EMPLEADO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TIPO_PROFESIONAL')
            and   type = 'U')
   drop table TIPO_PROFESIONAL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENTA')
            and   name  = 'RELATIONSHIP_14_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENTA.RELATIONSHIP_14_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENTA')
            and   name  = 'RELATIONSHIP_12_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENTA.RELATIONSHIP_12_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VENTA')
            and   name  = 'RELATIONSHIP_11_FK'
            and   indid > 0
            and   indid < 255)
   drop index VENTA.RELATIONSHIP_11_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VENTA')
            and   type = 'U')
   drop table VENTA
go

/*==============================================================*/
/* Table: CADENA_FUNERARIA                                      */
/*==============================================================*/
create table CADENA_FUNERARIA (
   ID_CADENA            numeric              identity,
   NOMBRE_CADENA        varchar(30)          not null,
   constraint PK_CADENA_FUNERARIA primary key (ID_CADENA)
)
go

/*==============================================================*/
/* Table: CAUSA                                                 */
/*==============================================================*/
create table CAUSA (
   ID_CAUSA             numeric              identity,
   ID_DIFUNTO           int                  not null,
   DESCRIPCION_CAUSA    varchar(50)          not null,
   constraint PK_CAUSA primary key (ID_CAUSA)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_15_FK on CAUSA (ID_DIFUNTO ASC)
go

/*==============================================================*/
/* Table: DIFUNTO                                               */
/*==============================================================*/
create table DIFUNTO (
   ID_DIFUNTO           numeric              identity,
   ID_FAMLIAR           int                  not null,
   NOMBRE_DIFUNTO       char(30)             not null,
   APELLIDO_DIFUNTO     varchar(30)          not null,
   GENERO_DIFUNTO       varchar(30)          not null,
   FECHANACIMIENTO_DIFUNTO datetime             not null,
   DIADEFUNSION_DIFUNTO datetime             not null,
   HORADEFUNSION_DIFUNTO datetime             not null,
   DIAEMBALSAMIENTO_DIFUNTO datetime             not null,
   HORAEMBALSAMIENTO    datetime             not null,
   constraint PK_DIFUNTO primary key (ID_DIFUNTO)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_16_FK on DIFUNTO (ID_FAMLIAR ASC)
go

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          numeric              identity,
   ID_CADENA            int                  not null,
   ID_TIPOEMPLEADO      int                  not null,
   NOMBRE_EMPLEADO      varchar(30)          not null,
   APELLIDO_EMPLEADO    varchar(30)          not null,
   CEDULA_EMPLEADO      varchar(15)          not null,
   DIRECCION_EMPLEADO   varchar(30)          not null,
   FECHANACIMIENTO_EMPLEADO date            not null,
   FECHAINGRESO_EMPLEADO date            not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_18_FK on EMPLEADO (ID_CADENA ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_23_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_23_FK on EMPLEADO (ID_TIPOEMPLEADO ASC)
go

/*==============================================================*/
/* Table: FAMILIAR                                              */
/*==============================================================*/
create table FAMILIAR (
   ID_FAMLIAR           numeric              identity,
   NOMBRE_FAMILIAR      varchar(30)          not null,
   APELLIDO_FAMILIAR    varchar(30)          not null,
   CEDULA_FAMILIAR      varchar(30)          not null,
   DIRECCION_FAMILIAR   varchar(30)          not null,
   TELEFONO_FAMILIAR    varchar(30)          not null,
   constraint PK_FAMILIAR primary key (ID_FAMLIAR)
)
go

/*==============================================================*/
/* Table: INSUMO                                                */
/*==============================================================*/
create table INSUMO (
   ID_INSUMO            numeric              identity,
   ID_ESPACIO           int                  not null,
   NOMBRE_INSUMO        varchar(30)          not null,
   COSTO_INSUMO         decimal              not null,
   constraint PK_INSUMO primary key (ID_INSUMO)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_13_FK on INSUMO (ID_ESPACIO ASC)
go

/*==============================================================*/
/* Table: PROFESIONAL                                           */
/*==============================================================*/
create table PROFESIONAL (
   ID_PROFESIONAL       numeric              identity,
   ID_CADENA            int                  not null,
   ID_TIPOPROFESIONAL   int                  not null,
   NOMBRE_PROFESIONAL   varchar(30)          not null,
   APELLIDO_PROFESIONAL varchar(30)          not null,
   CEDULA_PROFESIONAL   char(10)             not null,
   FECHANACIMIENTO_PROFESIONAL date            not null,
   FECHAINGRESO_PROFESIONAL date             not null,
   constraint PK_PROFESIONAL primary key (ID_PROFESIONAL)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_20_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_20_FK on PROFESIONAL (ID_CADENA ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_21_FK on PROFESIONAL (ID_TIPOPROFESIONAL ASC)
go

/*==============================================================*/
/* Table: SALA_VELATORIO                                        */
/*==============================================================*/
create table SALA_VELATORIO (
   ID_ESPACIO           numeric              identity,
   ID_EMPLEADO          int                  not null,
   ID_CADENA            int                  not null,
   NOMBRE_ESPACIO       varchar(30)          not null,
   DIMESIONES_ESPACIO   varchar(30)          not null,
   DIRECCION_ESPACIO    varchar(30)          not null,
   CAPACIDAD_ESPACIO    varchar(30)          not null,
   HORARIORESERVA_ESPACIO datetime             not null,
   OBSERVACIONES_ESPACIO varchar(85)          not null,
   PRECIO_ESPACIO       decimal  (10,2)             not null,
   constraint PK_SALA_VELATORIO primary key (ID_ESPACIO)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_17_FK on SALA_VELATORIO (ID_EMPLEADO ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_19_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_19_FK on SALA_VELATORIO (ID_CADENA ASC)
go

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_TIPOSERVICIO      numeric              identity,
   DESCRIPCION_SERVICIO varchar(50)          not null,
   COSTO_SERVICIO       decimal              not null,
   HABILITADO_SERVICIO  int                  ,
   constraint PK_SERVICIO primary key (ID_TIPOSERVICIO)
)
go

/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO (
   ID_TIPOEMPLEADO      numeric              identity,
   DESCRIPCION_TIPOEMPLEADO varchar(30)          not null,
   constraint PK_TIPO_EMPLEADO primary key (ID_TIPOEMPLEADO)
)
go

/*==============================================================*/
/* Table: TIPO_PROFESIONAL                                      */
/*==============================================================*/
create table TIPO_PROFESIONAL (
   ID_TIPOPROFESIONAL   numeric              identity,
   DESCRIPCION_PROFESIONAL varchar(30)          not null,
   constraint PK_TIPO_PROFESIONAL primary key (ID_TIPOPROFESIONAL)
)
go

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA (
   ID_VENTA             numeric              identity,
   ID_FAMLIAR           int                  not null,
   ID_TIPOSERVICIO      int                  not null,
   ID_ESPACIO           int                  not null,
   FORMADEPAGO_VENTA    varchar(50)          not null,
   FECHAPAGO_VENTA      date             not null,
   constraint PK_VENTA primary key (ID_VENTA)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_11_FK on VENTA (ID_FAMLIAR ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_12_FK on VENTA (ID_TIPOSERVICIO ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/




create nonclustered index RELATIONSHIP_14_FK on VENTA (ID_ESPACIO ASC)
go

alter table CAUSA
   add constraint FK_CAUSA_RELATIONS_DIFUNTO foreign key (ID_DIFUNTO)
      references DIFUNTO (ID_DIFUNTO)
go

alter table DIFUNTO
   add constraint FK_DIFUNTO_RELATIONS_FAMILIAR foreign key (ID_FAMLIAR)
      references FAMILIAR (ID_FAMLIAR)
go

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_CADENA_F foreign key (ID_CADENA)
      references CADENA_FUNERARIA (ID_CADENA)
go

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_TIPO_EMP foreign key (ID_TIPOEMPLEADO)
      references TIPO_EMPLEADO (ID_TIPOEMPLEADO)
go

alter table INSUMO
   add constraint FK_INSUMO_RELATIONS_SALA_VEL foreign key (ID_ESPACIO)
      references SALA_VELATORIO (ID_ESPACIO)
go

alter table PROFESIONAL
   add constraint FK_PROFESIO_RELATIONS_CADENA_F foreign key (ID_CADENA)
      references CADENA_FUNERARIA (ID_CADENA)
go

alter table PROFESIONAL
   add constraint FK_PROFESIO_RELATIONS_TIPO_PRO foreign key (ID_TIPOPROFESIONAL)
      references TIPO_PROFESIONAL (ID_TIPOPROFESIONAL)
go

alter table SALA_VELATORIO
   add constraint FK_SALA_VEL_RELATIONS_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
go

alter table SALA_VELATORIO
   add constraint FK_SALA_VEL_RELATIONS_CADENA_F foreign key (ID_CADENA)
      references CADENA_FUNERARIA (ID_CADENA)
go

alter table VENTA
   add constraint FK_VENTA_RELATIONS_FAMILIAR foreign key (ID_FAMLIAR)
      references FAMILIAR (ID_FAMLIAR)
go

alter table VENTA
   add constraint FK_VENTA_RELATIONS_SERVICIO foreign key (ID_TIPOSERVICIO)
      references SERVICIO (ID_TIPOSERVICIO)
go

alter table VENTA
   add constraint FK_VENTA_RELATIONS_SALA_VEL foreign key (ID_ESPACIO)
      references SALA_VELATORIO (ID_ESPACIO)
go
