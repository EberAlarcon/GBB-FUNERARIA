/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     17/12/2021 16:13:39                          */
/*==============================================================*/


alter table CAUSA 
   drop foreign key FK_CAUSA_TIENE12_DIFUNTO;

alter table DIFUNTO 
   drop foreign key FK_DIFUNTO_POSEE_FAMILIAR;

alter table EMPLEADO 
   drop foreign key FK_EMPLEADO_CONTIENE_TIPO_EMP;

alter table EMPLEADO 
   drop foreign key FK_EMPLEADO_ESTIMA_CADENA_F;

alter table INSUMO 
   drop foreign key FK_INSUMO_RELATIONS_SALA_VEL;

alter table PROFESIONAL 
   drop foreign key FK_PROFESIO_ALMACENA_TIPO_PRO;

alter table PROFESIONAL 
   drop foreign key FK_PROFESIO_CONSERVA_CADENA_F;

alter table SALA_VELATORIO 
   drop foreign key FK_SALA_VEL_ADMINISTR_EMPLEADO;

alter table SALA_VELATORIO 
   drop foreign key FK_SALA_VEL_ALMACENA2_DIFUNTO;

alter table SALA_VELATORIO 
   drop foreign key FK_SALA_VEL_MANEJA_CADENA_F;

alter table VENTA 
   drop foreign key FK_VENTA_ADQUIERE_FAMILIAR;

alter table VENTA 
   drop foreign key FK_VENTA_POSEEN_SALA_VEL;

alter table VENTA 
   drop foreign key FK_VENTA_RELATIONS_SERVICIO;

drop table if exists CADENA_FUNERARIA;


alter table CAUSA 
   drop foreign key FK_CAUSA_TIENE12_DIFUNTO;

drop table if exists CAUSA;


alter table DIFUNTO 
   drop foreign key FK_DIFUNTO_POSEE_FAMILIAR;

drop table if exists DIFUNTO;


alter table EMPLEADO 
   drop foreign key FK_EMPLEADO_ESTIMA_CADENA_F;

alter table EMPLEADO 
   drop foreign key FK_EMPLEADO_CONTIENE_TIPO_EMP;

drop table if exists EMPLEADO;

drop table if exists FAMILIAR;


alter table INSUMO 
   drop foreign key FK_INSUMO_RELATIONS_SALA_VEL;

drop table if exists INSUMO;


alter table PROFESIONAL 
   drop foreign key FK_PROFESIO_CONSERVA_CADENA_F;

alter table PROFESIONAL 
   drop foreign key FK_PROFESIO_ALMACENA_TIPO_PRO;

drop table if exists PROFESIONAL;


alter table SALA_VELATORIO 
   drop foreign key FK_SALA_VEL_MANEJA_CADENA_F;

alter table SALA_VELATORIO 
   drop foreign key FK_SALA_VEL_ALMACENA2_DIFUNTO;

alter table SALA_VELATORIO 
   drop foreign key FK_SALA_VEL_ADMINISTR_EMPLEADO;

drop table if exists SALA_VELATORIO;

drop table if exists SERVICIO;

drop table if exists TIPO_EMPLEADO;

drop table if exists TIPO_PROFESIONAL;


alter table VENTA 
   drop foreign key FK_VENTA_POSEEN_SALA_VEL;

alter table VENTA 
   drop foreign key FK_VENTA_ADQUIERE_FAMILIAR;

alter table VENTA 
   drop foreign key FK_VENTA_RELATIONS_SERVICIO;

drop table if exists VENTA;

/*==============================================================*/
/* Table: CADENA_FUNERARIA                                      */
/*==============================================================*/
create table CADENA_FUNERARIA
(
   ID_CADENA            int not null  comment '',
   NOMBRE_CADENA        varchar(30) not null  comment '',
   primary key (ID_CADENA)
);

/*==============================================================*/
/* Table: CAUSA                                                 */
/*==============================================================*/
create table CAUSA
(
   ID_CAUSA             int not null  comment '',
   ID_DIFUNTO           int not null  comment '',
   DESCRIPCION_CAUSA    varchar(50) not null  comment '',
   primary key (ID_CAUSA)
);

/*==============================================================*/
/* Table: DIFUNTO                                               */
/*==============================================================*/
create table DIFUNTO
(
   ID_DIFUNTO           int not null  comment '',
   ID_FAMLIAR           int not null  comment '',
   NOMBRE_DIFUNTO       char(30) not null  comment '',
   APELLIDO_DIFUNTO     varchar(30) not null  comment '',
   GENERO_DIFUNTO       varchar(30) not null  comment '',
   FECHANACIMIENTO_DIFUNTO date not null  comment '',
   DIADEFUNSION_DIFUNTO date not null  comment '',
   HORADEFUNSION_DIFUNTO time not null  comment '',
   DIAEMBALSAMIENTO_DIFUNTO date not null  comment '',
   MOMENTO_DIFUNTO      char(10) not null  comment '',
   HORAEMBALSAMIENTO    time not null  comment '',
   primary key (ID_DIFUNTO)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO
(
   ID_EMPLEADO          int not null  comment '',
   ID_CADENA            int not null  comment '',
   ID_TIPOEMPLEADO      int not null  comment '',
   NOMBRE_EMPLEADO      varchar(30) not null  comment '',
   APELLIDO_EMPLEADO    varchar(30) not null  comment '',
   CEDULA_EMPLEADO      varchar(15) not null  comment '',
   DIRECCION_EMPLEADO   varchar(30) not null  comment '',
   FECHANACIMIENTO_EMPLEADO date not null  comment '',
   FECHAINGRESO_EMPLEADO date not null  comment '',
   primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Table: FAMILIAR                                              */
/*==============================================================*/
create table FAMILIAR
(
   ID_FAMLIAR           int not null  comment '',
   NOMBRE_FAMILIAR      varchar(30) not null  comment '',
   APELLIDO_FAMILIAR    varchar(30) not null  comment '',
   CEDULA_FAMILIAR      varchar(30) not null  comment '',
   DIRECCION_FAMILIAR   varchar(30) not null  comment '',
   TELEFONO_FAMILIAR    varchar(30) not null  comment '',
   primary key (ID_FAMLIAR)
);

/*==============================================================*/
/* Table: INSUMO                                                */
/*==============================================================*/
create table INSUMO
(
   ID_INSUMO            int not null  comment '',
   ID_ESPACIO           int not null  comment '',
   NOMBRE_INSUMO        varchar(30) not null  comment '',
   COSTO_INSUMO         decimal not null  comment '',
   primary key (ID_INSUMO)
);

/*==============================================================*/
/* Table: PROFESIONAL                                           */
/*==============================================================*/
create table PROFESIONAL
(
   ID_PROFESIONAL       int not null  comment '',
   ID_CADENA            int not null  comment '',
   ID_TIPOPROFESIONAL   int not null  comment '',
   NOMBRE_PROFESIONAL   varchar(30) not null  comment '',
   APELLIDO_PROFESIONAL varchar(30) not null  comment '',
   CEDULA_PROFESIONAL   char(10) not null  comment '',
   FECHANACIMIENTO_PROFESIONAL date not null  comment '',
   primary key (ID_PROFESIONAL)
);

/*==============================================================*/
/* Table: SALA_VELATORIO                                        */
/*==============================================================*/
create table SALA_VELATORIO
(
   ID_ESPACIO           int not null  comment '',
   ID_CADENA            int not null  comment '',
   ID_DIFUNTO           int not null  comment '',
   ID_EMPLEADO          int not null  comment '',
   NOMBRE_ESPACIO       varchar(30) not null  comment '',
   DIMESIONES_ESPACIO   varchar(30) not null  comment '',
   DIRECCION_ESPACIO    varchar(30) not null  comment '',
   CAPACIDAD_ESPACIO    varchar(30) not null  comment '',
   HORARIORESERVA_ESPACIO datetime not null  comment '',
   OBSERVACIONES_ESPACIO varchar(85) not null  comment '',
   PRECIO_ESPACIO       decimal not null  comment '',
   primary key (ID_ESPACIO)
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO
(
   ID_TIPOSERVICIO      int not null  comment '',
   DESCRIPCION_SERVICIO varchar(50) not null  comment '',
   COSTO_SERVICIO       decimal not null  comment '',
   HABILITADO_SERVICIO  int not null  comment '',
   IMAGEN_SERVICIO      longblob not null  comment '',
   primary key (ID_TIPOSERVICIO)
);

/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO
(
   ID_TIPOEMPLEADO      int not null  comment '',
   DESCRIPCION_TIPOEMPLEADO varchar(30) not null  comment '',
   primary key (ID_TIPOEMPLEADO)
);

/*==============================================================*/
/* Table: TIPO_PROFESIONAL                                      */
/*==============================================================*/
create table TIPO_PROFESIONAL
(
   ID_TIPOPROFESIONAL   int not null  comment '',
   DESCRIPCION_PROFESIONAL varchar(30) not null  comment '',
   primary key (ID_TIPOPROFESIONAL)
);

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA
(
   ID_SERVICIO          int not null  comment '',
   ID_ESPACIO           int not null  comment '',
   ID_FAMLIAR           int not null  comment '',
   ID_TIPOSERVICIO      int not null  comment '',
   FORMADEPAGO_VENTA    varchar(50) not null  comment '',
   FRCHAPAGO_VENTA      date not null  comment '',
   primary key (ID_SERVICIO)
);

alter table CAUSA add constraint FK_CAUSA_TIENE12_DIFUNTO foreign key (ID_DIFUNTO)
      references DIFUNTO (ID_DIFUNTO) on delete restrict on update restrict;

alter table DIFUNTO add constraint FK_DIFUNTO_POSEE_FAMILIAR foreign key (ID_FAMLIAR)
      references FAMILIAR (ID_FAMLIAR) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_EMPLEADO_CONTIENE_TIPO_EMP foreign key (ID_TIPOEMPLEADO)
      references TIPO_EMPLEADO (ID_TIPOEMPLEADO) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_EMPLEADO_ESTIMA_CADENA_F foreign key (ID_CADENA)
      references CADENA_FUNERARIA (ID_CADENA) on delete restrict on update restrict;

alter table INSUMO add constraint FK_INSUMO_RELATIONS_SALA_VEL foreign key (ID_ESPACIO)
      references SALA_VELATORIO (ID_ESPACIO) on delete restrict on update restrict;

alter table PROFESIONAL add constraint FK_PROFESIO_ALMACENA_TIPO_PRO foreign key (ID_TIPOPROFESIONAL)
      references TIPO_PROFESIONAL (ID_TIPOPROFESIONAL) on delete restrict on update restrict;

alter table PROFESIONAL add constraint FK_PROFESIO_CONSERVA_CADENA_F foreign key (ID_CADENA)
      references CADENA_FUNERARIA (ID_CADENA) on delete restrict on update restrict;

alter table SALA_VELATORIO add constraint FK_SALA_VEL_ADMINISTR_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO) on delete restrict on update restrict;

alter table SALA_VELATORIO add constraint FK_SALA_VEL_ALMACENA2_DIFUNTO foreign key (ID_DIFUNTO)
      references DIFUNTO (ID_DIFUNTO) on delete restrict on update restrict;

alter table SALA_VELATORIO add constraint FK_SALA_VEL_MANEJA_CADENA_F foreign key (ID_CADENA)
      references CADENA_FUNERARIA (ID_CADENA) on delete restrict on update restrict;

alter table VENTA add constraint FK_VENTA_ADQUIERE_FAMILIAR foreign key (ID_FAMLIAR)
      references FAMILIAR (ID_FAMLIAR) on delete restrict on update restrict;

alter table VENTA add constraint FK_VENTA_POSEEN_SALA_VEL foreign key (ID_ESPACIO)
      references SALA_VELATORIO (ID_ESPACIO) on delete restrict on update restrict;

alter table VENTA add constraint FK_VENTA_RELATIONS_SERVICIO foreign key (ID_TIPOSERVICIO)
      references SERVICIO (ID_TIPOSERVICIO) on delete restrict on update restrict;

