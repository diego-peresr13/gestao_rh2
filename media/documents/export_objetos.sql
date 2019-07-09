----------------------------------------------------
-- Export file for user INTERATVI                 --
-- Created by diego.peres on 07/07/2019, 21:05:50 --
----------------------------------------------------

spool export_objetos.log

prompt
prompt Creating table CONCILIATION_DASBOARD
prompt ====================================
prompt
create table INTERATVI.CONCILIATION_DASBOARD
(
  ID_CONCILIATION_DASBOARD INTEGER not null,
  ID_COMPANY               INTEGER not null,
  ID_SUBSIDIARY            INTEGER not null,
  ID_CATEGORY              INTEGER,
  ID_TAX                   INTEGER,
  COD_ACCOUNT              VARCHAR2(70),
  PERIOD                   DATE
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.CONCILIATION_DASBOARD
  add constraint TBCONCILIATION_DASBOARD_PK primary key (ID_CONCILIATION_DASBOARD)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DASBOARD_VALUE
prompt =============================
prompt
create table INTERATVI.DASBOARD_VALUE
(
  ID_DASBOARD_VALUE INTEGER not null,
  ID_TAX            INTEGER not null,
  TAX               VARCHAR2(255),
  PRICEACCOUNT      NUMBER(19,2),
  PRICEFISCAL       NUMBER(19,2)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.DASBOARD_VALUE
  add constraint TBDASBOARD_VALUE_PK primary key (ID_DASBOARD_VALUE)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table I001_GRUPO_CORP
prompt ==============================
prompt
create table INTERATVI.I001_GRUPO_CORP
(
  ID_GRUPO_CORP INTEGER not null,
  DESCRICAO     VARCHAR2(255) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I001_GRUPO_CORP
  add constraint I001GRPEMPRESA_PK primary key (ID_GRUPO_CORP)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table I002_EMPRESA
prompt ===========================
prompt
create table INTERATVI.I002_EMPRESA
(
  ID_EMPRESA       INTEGER not null,
  ID_GRUPO_CORP    INTEGER not null,
  COD_EMPRESA      VARCHAR2(9) not null,
  CNPJ             VARCHAR2(14) not null,
  RAZAO_SOCIAL     VARCHAR2(255) not null,
  CHAVE_LICENCA    VARCHAR2(255),
  DATA_FIM_LICENCA DATE,
  ATIVO            CHAR(1),
  QTDE_FILIAIS     INTEGER not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I002_EMPRESA
  add constraint I002EMPRESA_PK primary key (ID_EMPRESA)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I002_EMPRESA
  add constraint I002GRUPO_EMPRESA_FK foreign key (ID_GRUPO_CORP)
  references INTERATVI.I001_GRUPO_CORP (ID_GRUPO_CORP);

prompt
prompt Creating table I003_MODULO
prompt ==========================
prompt
create table INTERATVI.I003_MODULO
(
  ID_MODULO   INTEGER not null,
  NOME_MODULO VARCHAR2(255)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I003_MODULO
  add constraint I003MODULO_PK primary key (ID_MODULO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table I004_EMPRESA_MODULO
prompt ==================================
prompt
create table INTERATVI.I004_EMPRESA_MODULO
(
  ID_EMPR_MODULO INTEGER not null,
  ID_EMPRESA     INTEGER not null,
  ID_MODULO      INTEGER not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I004_EMPRESA_MODULO
  add constraint I004EMPRESA_MODULO_PK primary key (ID_EMPR_MODULO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.I004_EMPRESA_MODULO
  add constraint I004EMPRESA_FK foreign key (ID_EMPRESA)
  references INTERATVI.I002_EMPRESA (ID_EMPRESA);
alter table INTERATVI.I004_EMPRESA_MODULO
  add constraint I004MODULO_FK foreign key (ID_MODULO)
  references INTERATVI.I003_MODULO (ID_MODULO);

prompt
prompt Creating table I011_UF
prompt ======================
prompt
create table INTERATVI.I011_UF
(
  ID_UF     INTEGER not null,
  COD_UF    VARCHAR2(2) not null,
  DESCRICAO VARCHAR2(255) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I011_UF
  add constraint I011UF_PK primary key (ID_UF)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table I012_MUNICIPIO
prompt =============================
prompt
create table INTERATVI.I012_MUNICIPIO
(
  ID_MUNICIPIO  INTEGER not null,
  COD_MUNICIPIO VARCHAR2(7) not null,
  DESCRICAO     VARCHAR2(255),
  ID_UF         INTEGER not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I012_MUNICIPIO
  add constraint I012MUNICIPIO_PK primary key (ID_MUNICIPIO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I012_MUNICIPIO
  add constraint I012UF_FK foreign key (ID_UF)
  references INTERATVI.I011_UF (ID_UF);

prompt
prompt Creating table I005_FILIAL
prompt ==========================
prompt
create table INTERATVI.I005_FILIAL
(
  ID_EMPRESA     INTEGER not null,
  ID_FILIAL      INTEGER not null,
  COD_FILIAL     VARCHAR2(6) not null,
  RAZAO_SOCIAL   VARCHAR2(60) not null,
  MATRIZ_FILIAL  CHAR(1),
  CNPJ           VARCHAR2(14) not null,
  NIRE           VARCHAR2(14),
  CNAE           VARCHAR2(7),
  INSCR_ESTADUAL VARCHAR2(14) not null,
  ENDERECO       VARCHAR2(60),
  NUM_ENDERECO   VARCHAR2(10),
  COMPL_ENDERECO VARCHAR2(60),
  BAIRRO         VARCHAR2(60),
  ID_UF          INTEGER not null,
  CEP            VARCHAR2(8),
  DATA_ABERTURA  DATE,
  ATIVO          CHAR(1) not null,
  ID_MUNICIPIO   INTEGER not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I005_FILIAL
  add constraint I005FILIAL_PK primary key (ID_FILIAL, ID_EMPRESA)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I005_FILIAL
  add constraint I005_FILIAL_I002_EMPRESA_FK foreign key (ID_EMPRESA)
  references INTERATVI.I002_EMPRESA (ID_EMPRESA);
alter table INTERATVI.I005_FILIAL
  add constraint I005MUNICIPIO_FK foreign key (ID_MUNICIPIO)
  references INTERATVI.I012_MUNICIPIO (ID_MUNICIPIO);
alter table INTERATVI.I005_FILIAL
  add constraint I005UF_FK foreign key (ID_UF)
  references INTERATVI.I011_UF (ID_UF);

prompt
prompt Creating table I006_GRUPO_ACESSO
prompt ================================
prompt
create table INTERATVI.I006_GRUPO_ACESSO
(
  ID_GRUPO_ACESSO INTEGER not null,
  NOME_GRUPO      VARCHAR2(255)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I006_GRUPO_ACESSO
  add constraint I006GRUPOACESSO_PK primary key (ID_GRUPO_ACESSO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table I007_GRUPO_MODULO
prompt ================================
prompt
create table INTERATVI.I007_GRUPO_MODULO
(
  ID_MODULO       INTEGER not null,
  ID_GRUPO_ACESSO INTEGER not null,
  ID_EMPRESA      INTEGER not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I007_GRUPO_MODULO
  add constraint I007_EMPRESA_FK foreign key (ID_EMPRESA)
  references INTERATVI.I002_EMPRESA (ID_EMPRESA);
alter table INTERATVI.I007_GRUPO_MODULO
  add constraint I007GRUPOACESSO_FK foreign key (ID_GRUPO_ACESSO)
  references INTERATVI.I006_GRUPO_ACESSO (ID_GRUPO_ACESSO);
alter table INTERATVI.I007_GRUPO_MODULO
  add constraint I007MODULO_FK foreign key (ID_MODULO)
  references INTERATVI.I003_MODULO (ID_MODULO);

prompt
prompt Creating table I008_GRUPO_FILIAL
prompt ================================
prompt
create table INTERATVI.I008_GRUPO_FILIAL
(
  ID_FILIAL       INTEGER not null,
  ID_GRUPO_ACESSO INTEGER not null,
  ID_EMPRESA      INTEGER not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I008_GRUPO_FILIAL
  add constraint I008FILIAL_FK foreign key (ID_FILIAL, ID_EMPRESA)
  references INTERATVI.I005_FILIAL (ID_FILIAL, ID_EMPRESA);
alter table INTERATVI.I008_GRUPO_FILIAL
  add constraint I008GRUPOACESSO_FK foreign key (ID_GRUPO_ACESSO)
  references INTERATVI.I006_GRUPO_ACESSO (ID_GRUPO_ACESSO);

prompt
prompt Creating table I009_GRUPO_EMPRESA
prompt =================================
prompt
create table INTERATVI.I009_GRUPO_EMPRESA
(
  ID_GRUPO_ACESSO INTEGER not null,
  ID_EMPRESA      INTEGER not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I009_GRUPO_EMPRESA
  add constraint I009EMPRESA_FK foreign key (ID_EMPRESA)
  references INTERATVI.I002_EMPRESA (ID_EMPRESA);
alter table INTERATVI.I009_GRUPO_EMPRESA
  add constraint I009GRUPOACESSO_FK foreign key (ID_GRUPO_ACESSO)
  references INTERATVI.I006_GRUPO_ACESSO (ID_GRUPO_ACESSO);

prompt
prompt Creating table I010_USUARIO
prompt ===========================
prompt
create table INTERATVI.I010_USUARIO
(
  ID_USUARIO       INTEGER not null,
  NOME_USUARIO     VARCHAR2(255) not null,
  NUM_CPF          VARCHAR2(70),
  LOGIN            VARCHAR2(70) not null,
  SENHA            VARCHAR2(70) not null,
  EMAIL            VARCHAR2(60) not null,
  ID_GRUPO_ACESSO  INTEGER not null,
  DT_ULTIMO_ACESSO DATE,
  DT_CRIACAO       DATE,
  DT_EXPIRA        DATE,
  STATUS           CHAR(1),
  RESP_LICENCA     CHAR(1)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I010_USUARIO
  add constraint I010USUARIO_PK primary key (ID_USUARIO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I010_USUARIO
  add constraint I010GRUPOACESSO_FK foreign key (ID_GRUPO_ACESSO)
  references INTERATVI.I006_GRUPO_ACESSO (ID_GRUPO_ACESSO);

prompt
prompt Creating table I013_PLANO_CONTAS
prompt ================================
prompt
create table INTERATVI.I013_PLANO_CONTAS
(
  ID_EMPRESA          INTEGER not null,
  COD_CONTA           VARCHAR2(70) not null,
  IND_CONTA           CHAR(1) not null,
  DESCRICAO_CONTA     VARCHAR2(255) not null,
  NIVEL               VARCHAR2(2) not null,
  COD_CONTA_SINTETICA VARCHAR2(70)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I013_PLANO_CONTAS
  add constraint I013PLANO_CONTAS_PK primary key (COD_CONTA, ID_EMPRESA)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I013_PLANO_CONTAS
  add constraint I013EMPRESA_FK foreign key (ID_EMPRESA)
  references INTERATVI.I002_EMPRESA (ID_EMPRESA);

prompt
prompt Creating table I014_CATEGORIA
prompt =============================
prompt
create table INTERATVI.I014_CATEGORIA
(
  ID_CATEGORIA INTEGER not null,
  DESCRICAO    VARCHAR2(255)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I014_CATEGORIA
  add constraint I014CATEGORIA_PK primary key (ID_CATEGORIA)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table I015_IMPOSTO
prompt ===========================
prompt
create table INTERATVI.I015_IMPOSTO
(
  ID_IMPOSTO   INTEGER not null,
  DESCRICAO    VARCHAR2(255),
  ID_CATEGORIA INTEGER not null,
  COD_IMPOSTO  VARCHAR2(10) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I015_IMPOSTO
  add constraint I015IMPOSTO_PK primary key (ID_IMPOSTO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I015_IMPOSTO
  add constraint I015CATEGORIA_FK foreign key (ID_CATEGORIA)
  references INTERATVI.I014_CATEGORIA (ID_CATEGORIA);
create unique index INTERATVI.UX_I015_IMPOSTO on INTERATVI.I015_IMPOSTO (COD_IMPOSTO)
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table I016_COD_DARF
prompt ============================
prompt
create table INTERATVI.I016_COD_DARF
(
  ID_IMPOSTO INTEGER not null,
  COD_DARF   VARCHAR2(6) not null,
  DESCRICAO  VARCHAR2(100)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I016_COD_DARF
  add constraint I015IMPOSTO_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);

prompt
prompt Creating table I017_CONFIG_INI
prompt ==============================
prompt
create table INTERATVI.I017_CONFIG_INI
(
  ID_CONFIG       INTEGER not null,
  ID_GRUPO_CORP   INTEGER not null,
  IND_INSTANCE    CHAR(1),
  OWNER_BD_ORIGEM VARCHAR2(20) not null,
  DBLINK          VARCHAR2(100) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I017_CONFIG_INI
  add constraint I017_CONFIG_INI_PK primary key (ID_CONFIG)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.I017_CONFIG_INI
  add constraint I017_CONFIG_INI_I001_FK foreign key (ID_GRUPO_CORP)
  references INTERATVI.I001_GRUPO_CORP (ID_GRUPO_CORP);

prompt
prompt Creating table I018_CLASS_PEND
prompt ==============================
prompt
create table INTERATVI.I018_CLASS_PEND
(
  ID_CLASS  INTEGER not null,
  DESCRICAO VARCHAR2(255) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I018_CLASS_PEND
  add constraint I020_CLASS_PEND_PK primary key (ID_CLASS)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table I019_CST
prompt =======================
prompt
create table INTERATVI.I019_CST
(
  ID_IMPOSTO INTEGER not null,
  CST        VARCHAR2(3) not null,
  DESCRICAO  VARCHAR2(255) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I019_CST
  add constraint I019_CST_PK primary key (CST)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.I019_CST
  add constraint I019_CST_I015_IMPOSTO_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);

prompt
prompt Creating table I020_RELAC_CST
prompt =============================
prompt
create table INTERATVI.I020_RELAC_CST
(
  ID_EMPRESA INTEGER not null,
  ID_IMPOSTO INTEGER not null,
  CST        VARCHAR2(3) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I020_RELAC_CST
  add constraint I020_RELAC_CST_PK primary key (CST, ID_EMPRESA, ID_IMPOSTO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.I020_RELAC_CST
  add constraint I020EMPRESA_FK foreign key (ID_EMPRESA)
  references INTERATVI.I002_EMPRESA (ID_EMPRESA);
alter table INTERATVI.I020_RELAC_CST
  add constraint I020IMPOSTO_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);
alter table INTERATVI.I020_RELAC_CST
  add constraint I020_RELAC_CST_I019_FK foreign key (CST)
  references INTERATVI.I019_CST (CST);

prompt
prompt Creating table I100_LANCAMENTOS
prompt ===============================
prompt
create table INTERATVI.I100_LANCAMENTOS
(
  ID_LANCAMENTO   VARCHAR2(50) not null,
  NUM_LANCTO      VARCHAR2(40) not null,
  ID_EMPRESA      INTEGER not null,
  ID_FILIAL       INTEGER not null,
  COD_CONTA       VARCHAR2(70) not null,
  DATA_LANCTO     DATE not null,
  NUM_ARQ         VARCHAR2(100) not null,
  VLR_LANCTO      NUMBER(19,2) not null,
  IND_DC          CHAR(1) not null,
  IND_LANCTO      CHAR(1) not null,
  TIPO_LANCTO     VARCHAR2(2),
  NUM_LANCTO_COMP VARCHAR2(40),
  DOCNUM          VARCHAR2(12),
  NUM_DOCTO       VARCHAR2(12),
  COD_PARCEIRO    VARCHAR2(14),
  CNPJ_PARCEIRO   VARCHAR2(14),
  AUX01           VARCHAR2(10),
  AUX02           VARCHAR2(20),
  AUX03           VARCHAR2(20),
  AUX04           VARCHAR2(20),
  AUX05           VARCHAR2(20),
  AUX06           VARCHAR2(20),
  IND_INTEGRACAO  CHAR(1) not null,
  ID_IMPOSTO      INTEGER not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column INTERATVI.I100_LANCAMENTOS.IND_LANCTO
  is 'N - Normal
E - Encerramento';
alter table INTERATVI.I100_LANCAMENTOS
  add constraint I100_LANCAMENTOS_PK primary key (ID_LANCAMENTO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I100_LANCAMENTOS
  add constraint I100FILIAL_FK foreign key (ID_FILIAL, ID_EMPRESA)
  references INTERATVI.I005_FILIAL (ID_FILIAL, ID_EMPRESA);
alter table INTERATVI.I100_LANCAMENTOS
  add constraint I100IMPOSTO_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);
alter table INTERATVI.I100_LANCAMENTOS
  add constraint I100PLANO_CONTAS_FK foreign key (COD_CONTA, ID_EMPRESA)
  references INTERATVI.I013_PLANO_CONTAS (COD_CONTA, ID_EMPRESA);

prompt
prompt Creating table I101_SALDOS
prompt ==========================
prompt
create table INTERATVI.I101_SALDOS
(
  ID_SALDO          VARCHAR2(50) not null,
  ID_EMPRESA        INTEGER not null,
  ID_FILIAL         INTEGER not null,
  PERIODO           DATE not null,
  COD_CONTA         VARCHAR2(70) not null,
  VLR_SALDO_INI     NUMBER(17,2) not null,
  IND_DEB_CRED_INI  CHAR(1) not null,
  VLR_SALDO_FIM     NUMBER(17,2) not null,
  IND_DEB_CRED_FIM  CHAR(1) not null,
  VLR_TOT_CRED      NUMBER(17,2),
  VLR_TOT_DEB       NUMBER(17,2),
  IND_CONTAB_FISCAL CHAR(1) not null,
  IND_INTEGRACAO    CHAR(1) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I101_SALDOS
  add constraint I101SALDOS_PK primary key (ID_SALDO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.I101_SALDOS
  add constraint I013PLANO_CONTAS_FK foreign key (COD_CONTA, ID_EMPRESA)
  references INTERATVI.I013_PLANO_CONTAS (COD_CONTA, ID_EMPRESA);
alter table INTERATVI.I101_SALDOS
  add constraint I101FILIAL_FK foreign key (ID_FILIAL, ID_EMPRESA)
  references INTERATVI.I005_FILIAL (ID_FILIAL, ID_EMPRESA);

prompt
prompt Creating table I200_NOTA_FISCAL
prompt ===============================
prompt
create table INTERATVI.I200_NOTA_FISCAL
(
  ID_NF          VARCHAR2(50) not null,
  ID_EMPRESA     INTEGER not null,
  ID_FILIAL      INTEGER not null,
  IND_OPER       CHAR(1) not null,
  IND_EMISSAO    CHAR(1) not null,
  IND_TIPO_NF    CHAR(1) not null,
  DATA_EMISSAO   DATE not null,
  DATA_E_S       DATE not null,
  NUM_NF         VARCHAR2(12) not null,
  SERIE          VARCHAR2(3) not null,
  NORM_DEV       CHAR(1) not null,
  CHAVE_NFE      VARCHAR2(44),
  TP_DOCTO       VARCHAR2(10) not null,
  DESC_TP_DOCTO  VARCHAR2(100),
  MODELO_NF      VARCHAR2(10),
  IND_SITUACAO   CHAR(1),
  IND_NF_MANUAL  CHAR(1),
  VLR_NF         NUMBER(17,2),
  VLR_MERC_SERV  NUMBER(17,2),
  NUM_LANCTO     VARCHAR2(40),
  DOCNUM         VARCHAR2(12),
  COD_PARCEIRO   VARCHAR2(14) not null,
  CNPJ_PARCEIRO  VARCHAR2(14),
  RAZAO_SOCIAL   VARCHAR2(100),
  INSCR_ESTADUAL VARCHAR2(14),
  AUX01          VARCHAR2(10),
  AUX02          VARCHAR2(20),
  AUX03          VARCHAR2(20),
  AUX04          VARCHAR2(20),
  AUX05          VARCHAR2(20),
  AUX06          VARCHAR2(20),
  IND_INTEGRACAO CHAR(1) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column INTERATVI.I200_NOTA_FISCAL.IND_OPER
  is 'Indicador do tipo de operação:
0- Entrada
1- Saída ';
comment on column INTERATVI.I200_NOTA_FISCAL.IND_EMISSAO
  is 'Indicador do emitente do documento fiscal:
0- Emissão própria
1- Terceiros ';
comment on column INTERATVI.I200_NOTA_FISCAL.IND_TIPO_NF
  is 'Indicar se a NF é:
1. Escriturada - Mercadoria
2. Escriturada - Serviço
3. Escriturada - Mista
4. Escriturada - Frete
5. Não Escriturada - Mercadoria
6. Não Escriturada - Serviço
7. Não Escriturada - Mista
8. Não Escriturada - Frete';
alter table INTERATVI.I200_NOTA_FISCAL
  add constraint I200NF_PK primary key (ID_NF)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I200_NOTA_FISCAL
  add constraint I200FILIAL_FK foreign key (ID_FILIAL, ID_EMPRESA)
  references INTERATVI.I005_FILIAL (ID_FILIAL, ID_EMPRESA);

prompt
prompt Creating table I201_NF_ITEM
prompt ===========================
prompt
create table INTERATVI.I201_NF_ITEM
(
  ID_NF             VARCHAR2(50) not null,
  COD_ITEM          VARCHAR2(35) not null,
  DESCRICAO_ITEM    VARCHAR2(100),
  COD_NCM           VARCHAR2(10),
  DESCR_NCM         VARCHAR2(100),
  NUM_ITEM          NUMBER(12) not null,
  CFOP              VARCHAR2(4),
  DESCR_CFOP        VARCHAR2(100),
  NAT_OP            VARCHAR2(3),
  DESCR_NAT_OP      VARCHAR2(100),
  COD_MEDIDA        VARCHAR2(3),
  VLR_ITEM          NUMBER(17,2) not null,
  VLR_CONTABIL_ITEM NUMBER(17,2) not null,
  NUM_PEDIDO        VARCHAR2(30),
  COD_LEI_116       VARCHAR2(20)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column INTERATVI.I201_NF_ITEM.COD_LEI_116
  is 'Aplicavel somente para Notas de Servico';
alter table INTERATVI.I201_NF_ITEM
  add constraint I201ITEM_PK primary key (ID_NF, NUM_ITEM)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I201_NF_ITEM
  add constraint I201NOTA_FISCAL_FK foreign key (ID_NF)
  references INTERATVI.I200_NOTA_FISCAL (ID_NF);

prompt
prompt Creating table I202_ITEM_IMPOSTO
prompt ================================
prompt
create table INTERATVI.I202_ITEM_IMPOSTO
(
  ID_NF          VARCHAR2(50) not null,
  NUM_ITEM       NUMBER(12) not null,
  ID_IMPOSTO     INTEGER not null,
  IND_TRIBUTACAO CHAR(1) not null,
  VLR_BASE       NUMBER(17,2) not null,
  VLR_ALIQ       NUMBER(7,4) not null,
  VLR_TRIBUTO    NUMBER(17,2) not null,
  CST            VARCHAR2(3)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column INTERATVI.I202_ITEM_IMPOSTO.IND_TRIBUTACAO
  is 'T - Tributada
I - Isenta
O - Outras
R - Reduzida';
alter table INTERATVI.I202_ITEM_IMPOSTO
  add constraint I202_IMPOSTO_PK primary key (ID_NF, NUM_ITEM, ID_IMPOSTO, IND_TRIBUTACAO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I202_ITEM_IMPOSTO
  add constraint I202IMPOSTO_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);
alter table INTERATVI.I202_ITEM_IMPOSTO
  add constraint I202NF_ITEM_FK foreign key (ID_NF, NUM_ITEM)
  references INTERATVI.I201_NF_ITEM (ID_NF, NUM_ITEM);

prompt
prompt Creating table I203_ATIVO
prompt =========================
prompt
create table INTERATVI.I203_ATIVO
(
  ID_DOCTO_ATIVO VARCHAR2(50) not null,
  TIPO_DOCTO     VARCHAR2(10) not null,
  DATA_PARCELA   DATE not null,
  NUM_PARCELA    INTEGER,
  ID_EMPRESA     INTEGER not null,
  ID_FILIAL      INTEGER not null,
  ID_IMPOSTO     INTEGER not null,
  NUM_LANCTO     VARCHAR2(40),
  VLR_OPERACAO   NUMBER(17,2) not null,
  CST            VARCHAR2(2) not null,
  VLR_BASE       NUMBER(17,2) not null,
  VLR_ALIQUOTA   NUMBER(7,4) not null,
  VLR_TRIBUTO    NUMBER(17,2) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I203_ATIVO
  add constraint I203_ATIVO_PK primary key (ID_DOCTO_ATIVO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.I203_ATIVO
  add constraint I203_ATIVO_I005_FK foreign key (ID_FILIAL, ID_EMPRESA)
  references INTERATVI.I005_FILIAL (ID_FILIAL, ID_EMPRESA);
alter table INTERATVI.I203_ATIVO
  add constraint I203_ATIVO_I015_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);

prompt
prompt Creating table I204_OUTROS_DOCTOS
prompt =================================
prompt
create table INTERATVI.I204_OUTROS_DOCTOS
(
  ID_DOCTO      VARCHAR2(50) not null,
  DATA_DOCTO    DATE,
  TIPO_DOCTO    VARCHAR2(10) not null,
  ID_EMPRESA    INTEGER not null,
  ID_FILIAL     INTEGER not null,
  ID_IMPOSTO    INTEGER not null,
  NUM_DOCTO     VARCHAR2(12),
  SERIE_DOCTO   VARCHAR2(3),
  NUM_LANCTO    VARCHAR2(40),
  VLR_OPERACAO  NUMBER(17,2) not null,
  CST           VARCHAR2(2) not null,
  VLR_BASE      NUMBER(17,2) not null,
  VLR_ALILQUOTA NUMBER(7,4) not null,
  VLR_TRIBUTO   NUMBER(17,2) not null,
  DESCRICAO     VARCHAR2(100)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I204_OUTROS_DOCTOS
  add constraint I204_OUTROS_DOCTOS_PK primary key (ID_DOCTO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.I204_OUTROS_DOCTOS
  add constraint I204_OUTROS_DOCTOS_I005_FK foreign key (ID_FILIAL, ID_EMPRESA)
  references INTERATVI.I005_FILIAL (ID_FILIAL, ID_EMPRESA);
alter table INTERATVI.I204_OUTROS_DOCTOS
  add constraint I204_OUTROS_DOCTOS_I015_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);

prompt
prompt Creating table I210_RETENCOES
prompt =============================
prompt
create table INTERATVI.I210_RETENCOES
(
  ID_DOCTO          VARCHAR2(50) not null,
  ID_EMPRESA        INTEGER not null,
  ID_FILIAL         INTEGER not null,
  COD_DARF          VARCHAR2(6) not null,
  DATA_FATO_GERADOR DATE not null,
  DOCNUM            VARCHAR2(12),
  MOVTO             CHAR(1),
  NUM_DOCTO         VARCHAR2(12) not null,
  DATA_DOCTO        DATE not null,
  SERIE_DOCTO       VARCHAR2(3) not null,
  TP_DOCTO          VARCHAR2(10),
  DESC_TP_DOCTO     VARCHAR2(100),
  NUM_LANCTO        VARCHAR2(40),
  NUM_LANCTO_COMP   VARCHAR2(40),
  COD_PARCEIRO      VARCHAR2(14) not null,
  CNPJ_PARCEIRO     VARCHAR2(14),
  RAZAO_SOCIAL      VARCHAR2(100),
  INSC_ESTADUAL     VARCHAR2(14),
  VLR_DOCTO         NUMBER(17,2) not null,
  VLR_ALIQ          NUMBER(7,4) not null,
  VLR_RETENCAO      NUMBER(17,2) not null,
  IND_DOCTO_MANUAL  CHAR(1),
  AUX01             VARCHAR2(10),
  AUX02             VARCHAR2(20),
  AUX03             VARCHAR2(20),
  AUX04             VARCHAR2(20),
  AUX05             VARCHAR2(20),
  AUX06             VARCHAR2(20),
  IND_INTEGRACAO    CHAR(1)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I210_RETENCOES
  add constraint I210RETENCOES_PK primary key (ID_DOCTO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I210_RETENCOES
  add constraint I210_RETENCOES_I005_FILIAL_FK foreign key (ID_FILIAL, ID_EMPRESA)
  references INTERATVI.I005_FILIAL (ID_FILIAL, ID_EMPRESA);

prompt
prompt Creating table I220_LANCTO_APURACAO
prompt ===================================
prompt
create table INTERATVI.I220_LANCTO_APURACAO
(
  ID_LANCTO_APURACAO VARCHAR2(50) not null,
  ID_EMPRESA         INTEGER not null,
  ID_FILIAL          INTEGER not null,
  ID_IMPOSTO         INTEGER not null,
  DATA_APUR          DATE not null,
  COD_OPER_APUR      VARCHAR2(3) not null,
  DESC_OPER_APUR     VARCHAR2(50) not null,
  SEQUENCIAL         NUMBER(10),
  DESCRICAO          VARCHAR2(50),
  VLR_APUR           NUMBER(17,2) not null,
  IND_INTEGRACAO     CHAR(1) not null,
  COD_AJUSTE         VARCHAR2(20),
  COD_LIVRO          VARCHAR2(3) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I220_LANCTO_APURACAO
  add constraint I220_LANCTO_APURACAO_PK primary key (ID_LANCTO_APURACAO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.I220_LANCTO_APURACAO
  add constraint I220_LANCTO_APUR_I005_FK foreign key (ID_FILIAL, ID_EMPRESA)
  references INTERATVI.I005_FILIAL (ID_FILIAL, ID_EMPRESA);
alter table INTERATVI.I220_LANCTO_APURACAO
  add constraint I220_LANCTO_APUR_I015_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);

prompt
prompt Creating table I221_GUIA_PAGAMENTO
prompt ==================================
prompt
create table INTERATVI.I221_GUIA_PAGAMENTO
(
  ID_GUIA        VARCHAR2(50) not null,
  ID_EMPRESA     INTEGER not null,
  ID_FILIAL      INTEGER not null,
  ID_IMPOSTO     INTEGER not null,
  DATA_APUR      DATE,
  DATA_PAGTO     DATE,
  NUM_GUIA       NUMBER(10),
  DESCRICAO      VARCHAR2(50),
  VLR_GUIA       NUMBER(17,2),
  VLR_RESIDUAL   NUMBER(17,2) not null,
  VLR_BAIXADO    NUMBER(17,2) not null,
  IND_INTEGRACAO CHAR(1) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I221_GUIA_PAGAMENTO
  add constraint I221_GUIA_PAGAMENTO_PK primary key (ID_GUIA)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.I221_GUIA_PAGAMENTO
  add constraint I221_GUIA_I005_FK foreign key (ID_FILIAL, ID_EMPRESA)
  references INTERATVI.I005_FILIAL (ID_FILIAL, ID_EMPRESA);
alter table INTERATVI.I221_GUIA_PAGAMENTO
  add constraint I221_GUIA_I015_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);

prompt
prompt Creating table I222_GUIA_ITEM
prompt =============================
prompt
create table INTERATVI.I222_GUIA_ITEM
(
  ID_GUIA      VARCHAR2(50) not null,
  NUM_DOCTO    VARCHAR2(12) not null,
  DATA_DOCTO   DATE,
  VALOR_DOCTO  NUMBER(17,2) not null,
  ID_UTILIZADO CHAR(1)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.I222_GUIA_ITEM
  add constraint I222_GUIA_PAGAMENTO_FK foreign key (ID_GUIA)
  references INTERATVI.I221_GUIA_PAGAMENTO (ID_GUIA);

prompt
prompt Creating table I500_PARAM_CONTA
prompt ===============================
prompt
create table INTERATVI.I500_PARAM_CONTA
(
  ID_EMPRESA INTEGER not null,
  COD_CONTA  VARCHAR2(70) not null,
  ID_IMPOSTO INTEGER not null,
  MOVTO      CHAR(1) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I500_PARAM_CONTA
  add constraint I500_PARAM_CONTA_PK primary key (ID_EMPRESA, COD_CONTA, ID_IMPOSTO, MOVTO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I500_PARAM_CONTA
  add constraint I500EMPRESA_FK foreign key (ID_EMPRESA)
  references INTERATVI.I002_EMPRESA (ID_EMPRESA);
alter table INTERATVI.I500_PARAM_CONTA
  add constraint I500IMPOSTO_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);
alter table INTERATVI.I500_PARAM_CONTA
  add constraint I500PLANO_CONTAS_FK foreign key (COD_CONTA, ID_EMPRESA)
  references INTERATVI.I013_PLANO_CONTAS (COD_CONTA, ID_EMPRESA);

prompt
prompt Creating table I501_PARAM_CONC_LEVEL
prompt ====================================
prompt
create table INTERATVI.I501_PARAM_CONC_LEVEL
(
  ID_CONC_LEVEL INTEGER not null,
  ID_EMPRESA    INTEGER not null,
  ID_FILIAL     INTEGER not null,
  ID_IMPOSTO    INTEGER not null,
  IND_LEVEL     INTEGER not null,
  VLR_LANCTO    NUMBER(17,2) not null,
  FIELD1        VARCHAR2(30),
  FIELD2        VARCHAR2(30),
  FIELD3        VARCHAR2(30),
  FIELD4        VARCHAR2(30),
  FIELD5        VARCHAR2(30),
  FIELD6        VARCHAR2(30)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column INTERATVI.I501_PARAM_CONC_LEVEL.IND_LEVEL
  is '1 a 6';
alter table INTERATVI.I501_PARAM_CONC_LEVEL
  add constraint I501_PARAM_CONC_LEVEL_PK primary key (ID_CONC_LEVEL)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.I501_PARAM_CONC_LEVEL
  add constraint I501EMPRESA_FK foreign key (ID_EMPRESA)
  references INTERATVI.I002_EMPRESA (ID_EMPRESA);
alter table INTERATVI.I501_PARAM_CONC_LEVEL
  add constraint I501FILIAL_FK foreign key (ID_FILIAL, ID_EMPRESA)
  references INTERATVI.I005_FILIAL (ID_FILIAL, ID_EMPRESA);
alter table INTERATVI.I501_PARAM_CONC_LEVEL
  add constraint I501IMPOSTO_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);

prompt
prompt Creating table I800_CONCILIACAO
prompt ===============================
prompt
create table INTERATVI.I800_CONCILIACAO
(
  ID_CONCILIACAO INTEGER not null,
  ID_IMPOSTO     INTEGER not null,
  PERIODO        DATE not null,
  ID_EMPRESA     INTEGER not null,
  USUARIO        VARCHAR2(35) not null,
  DATA_CRIACAO   DATE not null,
  IND_STATUS     CHAR(1) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I800_CONCILIACAO
  add constraint I800CONCILIACAO_PK primary key (ID_CONCILIACAO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I800_CONCILIACAO
  add constraint I800_CONCILIACAO_UN unique (ID_IMPOSTO, PERIODO, ID_EMPRESA, IND_STATUS)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I800_CONCILIACAO
  add constraint I800EMPRESA_FK foreign key (ID_EMPRESA)
  references INTERATVI.I002_EMPRESA (ID_EMPRESA);
alter table INTERATVI.I800_CONCILIACAO
  add constraint I800IMPOSTO_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);

prompt
prompt Creating table I801_CONCILIACAO_DET
prompt ===================================
prompt
create table INTERATVI.I801_CONCILIACAO_DET
(
  ID_CONCILIACAO INTEGER not null,
  ID_LANCAMENTO  VARCHAR2(50) not null,
  ID_DOCTO       VARCHAR2(50) not null,
  COD_CONTA      VARCHAR2(70) not null,
  PERIODO        DATE not null,
  ORIGEM         VARCHAR2(4) not null,
  IND_CONCILIADO CHAR(1) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column INTERATVI.I801_CONCILIACAO_DET.IND_CONCILIADO
  is 'A - Automatico
M - Manual';
alter table INTERATVI.I801_CONCILIACAO_DET
  add constraint I801CONCILIACAO_DET_PK primary key (ID_CONCILIACAO, ID_LANCAMENTO, ID_DOCTO, COD_CONTA, PERIODO, ORIGEM)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I801_CONCILIACAO_DET
  add constraint I801DET_CONCILIACAO_FK foreign key (ID_CONCILIACAO)
  references INTERATVI.I800_CONCILIACAO (ID_CONCILIACAO);

prompt
prompt Creating table I802_LANCTO_PROC
prompt ===============================
prompt
create table INTERATVI.I802_LANCTO_PROC
(
  ID_LANCAMENTO       VARCHAR2(50) not null,
  ID_EMPRESA          INTEGER not null,
  ID_FILIAL           INTEGER not null,
  NUM_LANCTO          VARCHAR2(60) not null,
  IND_DEB_CRED        CHAR(1),
  COD_CONTA           VARCHAR2(70) not null,
  VLR_LANCTO_RESIDUAL NUMBER(17,2) not null,
  VLR_LANCTO_ORIGINAL NUMBER(17,2),
  DATA_LANCTO         DATE not null,
  JUSTIFICATIVA       VARCHAR2(255),
  ID_CLASS            INTEGER not null,
  ID_IMPOSTO          INTEGER not null,
  ID_CONCILIACAO      INTEGER
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I802_LANCTO_PROC
  add constraint I802_LANCTO_PROC_UN unique (ID_LANCAMENTO, NUM_LANCTO, IND_DEB_CRED, COD_CONTA, DATA_LANCTO, ID_EMPRESA, ID_CONCILIACAO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I802_LANCTO_PROC
  add constraint I802_LANCTO_CLASS_PEND_FK foreign key (ID_CLASS)
  references INTERATVI.I018_CLASS_PEND (ID_CLASS);
alter table INTERATVI.I802_LANCTO_PROC
  add constraint I802PLANO_CONTAS_FK foreign key (COD_CONTA, ID_EMPRESA)
  references INTERATVI.I013_PLANO_CONTAS (COD_CONTA, ID_EMPRESA);

prompt
prompt Creating table I803_DOCTO_PROC
prompt ==============================
prompt
create table INTERATVI.I803_DOCTO_PROC
(
  ID_DOCUMENTO   VARCHAR2(50),
  ID_EMPRESA     INTEGER not null,
  ID_FILIAL      INTEGER not null,
  NUM_DOCTO      VARCHAR2(12) not null,
  DATA_DOCTO     DATE not null,
  MOVTO          CHAR(1) not null,
  VLR_LANCTO     NUMBER(17,2) not null,
  ORIGEM         VARCHAR2(4) not null,
  NUM_LANCTO     VARCHAR2(60),
  COD_CONTA      VARCHAR2(70) not null,
  ID_IMPOSTO     INTEGER not null,
  JUSTIFICATIVA  VARCHAR2(255),
  ID_CLASS       INTEGER not null,
  ID_CONCILIACAO INTEGER
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I803_DOCTO_PROC
  add constraint I803_DOCTO_PROC_UN unique (ID_DOCUMENTO, NUM_DOCTO, DATA_DOCTO, MOVTO, ORIGEM, NUM_LANCTO, ID_IMPOSTO, ID_FILIAL, ID_EMPRESA, ID_CONCILIACAO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I803_DOCTO_PROC
  add constraint I803_DOCTO_CLASS_PEND_FK foreign key (ID_CLASS)
  references INTERATVI.I018_CLASS_PEND (ID_CLASS);
alter table INTERATVI.I803_DOCTO_PROC
  add constraint I803IMPOSTO_FK foreign key (ID_IMPOSTO)
  references INTERATVI.I015_IMPOSTO (ID_IMPOSTO);

prompt
prompt Creating table I900_PROCESSO_LOG
prompt ================================
prompt
create table INTERATVI.I900_PROCESSO_LOG
(
  NUM_PROCESSO  INTEGER not null,
  MSG_ERRO      VARCHAR2(255),
  PROCESSO      VARCHAR2(255),
  ERRO_DB       VARCHAR2(255),
  ID_USUARIO    INTEGER not null,
  DATA_PROCESSO TIMESTAMP(6)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTERATVI.I900_PROCESSO_LOG
  add constraint PROCESSO_LOG_PK primary key (NUM_PROCESSO)
  disable;
alter table INTERATVI.I900_PROCESSO_LOG
  add constraint I900_USUARIO_FK foreign key (ID_USUARIO)
  references INTERATVI.I010_USUARIO (ID_USUARIO);

prompt
prompt Creating table I901_REPROC_CONCILIACAO
prompt ======================================
prompt
create table INTERATVI.I901_REPROC_CONCILIACAO
(
  ID_CONCILIACAO INTEGER not null,
  ID_LANCAMENTO  VARCHAR2(50) not null,
  ID_DOCTO       VARCHAR2(50) not null,
  COD_CONTA      VARCHAR2(70) not null,
  PERIODO        DATE not null,
  ORIGEM         VARCHAR2(4) not null,
  IND_CONCILIADO CHAR(1) not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column INTERATVI.I901_REPROC_CONCILIACAO.IND_CONCILIADO
  is 'A - Automatico
M - Manual';
alter table INTERATVI.I901_REPROC_CONCILIACAO
  add constraint I901_REPROC_CONCILIACAO_PK primary key (ID_CONCILIACAO)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table I902_PROCESSO_PROC
prompt =================================
prompt
create table INTERATVI.I902_PROCESSO_PROC
(
  ID_JOB_PROCESS INTEGER not null,
  CONTROL        VARCHAR2(255),
  PROCEDURE      VARCHAR2(255) not null,
  DATE_INITIAL   DATE not null,
  DATE_FINAL     DATE not null,
  STATUS         INTEGER not null,
  MESSAGE        VARCHAR2(800)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column INTERATVI.I902_PROCESSO_PROC.STATUS
  is '1 - PENDENTE
2 - CONCLUIDO
3 - ERRO';

prompt
prompt Creating table I903_CONC_MANUAL
prompt ===============================
prompt
create table INTERATVI.I903_CONC_MANUAL
(
  ID_CONCILIACAO INTEGER,
  ID_MANUAL      VARCHAR2(50),
  TIPO           CHAR(1)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table LAYOUT
prompt =====================
prompt
create table INTERATVI.LAYOUT
(
  ID_LAYOUT  INTEGER not null,
  NAME       VARCHAR2(255) not null,
  NAME_TABLE VARCHAR2(255) not null,
  CONTROL    VARCHAR2(255) not null,
  ENABLE     CHAR(1)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.LAYOUT
  add constraint TBLAYOUT_PK primary key (ID_LAYOUT)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table LAYOUT_FIELD
prompt ===========================
prompt
create table INTERATVI.LAYOUT_FIELD
(
  ID_LAYOUT_FIELD INTEGER not null,
  ID_LAYOUT       INTEGER not null,
  FIELD_SOURCE    VARCHAR2(255) not null,
  FIELD_DESTINY   VARCHAR2(255) not null,
  FIELD_ORDER     INTEGER not null
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.LAYOUT_FIELD
  add constraint TBLAYOUT_FIELD_PK primary key (ID_LAYOUT_FIELD)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.LAYOUT_FIELD
  add constraint TBLAYOUT_FIELD_FK foreign key (ID_LAYOUT)
  references INTERATVI.LAYOUT (ID_LAYOUT);

prompt
prompt Creating table LAYOUT_LOG
prompt =========================
prompt
create table INTERATVI.LAYOUT_LOG
(
  ID_LAYOUT_LOG INTEGER not null,
  ID_LAYOUT     INTEGER not null,
  FILE_NAME     VARCHAR2(255) not null,
  FILE_TOKEN    VARCHAR2(255) not null,
  STATUS        INTEGER not null,
  LINES         INTEGER,
  MESSAGE       VARCHAR2(800)
)
tablespace INTERATVI_D
  pctfree 10
  initrans 1
  maxtrans 255;
alter table INTERATVI.LAYOUT_LOG
  add constraint TBLAYOUT_LOG_PK primary key (ID_LAYOUT_LOG)
  using index 
  tablespace INTERATVI_D
  pctfree 10
  initrans 2
  maxtrans 255;
alter table INTERATVI.LAYOUT_LOG
  add constraint TBLAYOUT_LOG_FK foreign key (ID_LAYOUT)
  references INTERATVI.LAYOUT (ID_LAYOUT);

prompt
prompt Creating sequence SEQ_CONCILIATION_DASBOARD
prompt ===========================================
prompt
create sequence INTERATVI.SEQ_CONCILIATION_DASBOARD
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DASBOARD_VALUE
prompt ====================================
prompt
create sequence INTERATVI.SEQ_DASBOARD_VALUE
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I001_GRUPO_CORP
prompt =====================================
prompt
create sequence INTERATVI.SEQ_I001_GRUPO_CORP
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I002_EMPRESA
prompt ==================================
prompt
create sequence INTERATVI.SEQ_I002_EMPRESA
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I003_MODULO
prompt =================================
prompt
create sequence INTERATVI.SEQ_I003_MODULO
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I004_EMP_MODULO
prompt =====================================
prompt
create sequence INTERATVI.SEQ_I004_EMP_MODULO
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I005_FILIAL
prompt =================================
prompt
create sequence INTERATVI.SEQ_I005_FILIAL
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I006_GRUPO_ACESSO
prompt =======================================
prompt
create sequence INTERATVI.SEQ_I006_GRUPO_ACESSO
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I010_USUARIO
prompt ==================================
prompt
create sequence INTERATVI.SEQ_I010_USUARIO
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I011_UF
prompt =============================
prompt
create sequence INTERATVI.SEQ_I011_UF
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I012_MUNICIPIO
prompt ====================================
prompt
create sequence INTERATVI.SEQ_I012_MUNICIPIO
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I014_CATEGORIA
prompt ====================================
prompt
create sequence INTERATVI.SEQ_I014_CATEGORIA
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I015_IMPOSTO
prompt ==================================
prompt
create sequence INTERATVI.SEQ_I015_IMPOSTO
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I017_CONFIG
prompt =================================
prompt
create sequence INTERATVI.SEQ_I017_CONFIG
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I018_CLASS_PEND
prompt =====================================
prompt
create sequence INTERATVI.SEQ_I018_CLASS_PEND
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_I200_LANCTO
prompt =================================
prompt
create sequence INTERATVI.SEQ_I200_LANCTO
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_LAYOUT
prompt ============================
prompt
create sequence INTERATVI.SEQ_LAYOUT
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_LAYOUT_FIELD
prompt ==================================
prompt
create sequence INTERATVI.SEQ_LAYOUT_FIELD
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_LAYOUT_LOG
prompt ================================
prompt
create sequence INTERATVI.SEQ_LAYOUT_LOG
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating synonym DWT_DOCTO_FISCAL
prompt =================================
prompt
create or replace synonym INTERATVI.DWT_DOCTO_FISCAL
  for MSAF.DWT_DOCTO_FISCAL;

prompt
prompt Creating synonym DWT_ITENS_MERC
prompt ===============================
prompt
create or replace synonym INTERATVI.DWT_ITENS_MERC
  for MSAF.DWT_ITENS_MERC;

prompt
prompt Creating synonym DWT_ITENS_SERV
prompt ===============================
prompt
create or replace synonym INTERATVI.DWT_ITENS_SERV
  for MSAF.DWT_ITENS_SERV;

prompt
prompt Creating synonym DWT_SERVICO_LEI_116
prompt ====================================
prompt
create or replace synonym INTERATVI.DWT_SERVICO_LEI_116
  for MSAF.DWT_SERVICO_LEI_116;

prompt
prompt Creating synonym EFD_DADOS_INICIAIS_PISCOF
prompt ==========================================
prompt
create or replace synonym INTERATVI.EFD_DADOS_INICIAIS_PISCOF
  for MSAF.EFD_DADOS_INICIAIS_PISCOF;

prompt
prompt Creating synonym EMPRESA
prompt ========================
prompt
create or replace synonym INTERATVI.EMPRESA
  for MSAF.EMPRESA;

prompt
prompt Creating synonym EPC_APURACAO
prompt =============================
prompt
create or replace synonym INTERATVI.EPC_APURACAO
  for MSAF.EPC_APURACAO;

prompt
prompt Creating synonym EPC_REG_AJT_M100_M500
prompt ======================================
prompt
create or replace synonym INTERATVI.EPC_REG_AJT_M100_M500
  for MSAF.EPC_REG_AJT_M100_M500;

prompt
prompt Creating synonym EPC_REG_AJT_M110_M510
prompt ======================================
prompt
create or replace synonym INTERATVI.EPC_REG_AJT_M110_M510
  for MSAF.EPC_REG_AJT_M110_M510;

prompt
prompt Creating synonym EPC_TP_DOC_CSTOPNAT
prompt ====================================
prompt
create or replace synonym INTERATVI.EPC_TP_DOC_CSTOPNAT
  for MSAF.EPC_TP_DOC_CSTOPNAT;

prompt
prompt Creating synonym ESTABELECIMENTO
prompt ================================
prompt
create or replace synonym INTERATVI.ESTABELECIMENTO
  for MSAF.ESTABELECIMENTO;

prompt
prompt Creating synonym ESTADO
prompt =======================
prompt
create or replace synonym INTERATVI.ESTADO
  for MSAF.ESTADO;

prompt
prompt Creating synonym GRUPO_ESTAB
prompt ============================
prompt
create or replace synonym INTERATVI.GRUPO_ESTAB
  for MSAF.GRUPO_ESTAB;

prompt
prompt Creating synonym ITEM_APURAC_DISCR
prompt ==================================
prompt
create or replace synonym INTERATVI.ITEM_APURAC_DISCR
  for MSAF.ITEM_APURAC_DISCR;

prompt
prompt Creating synonym MUNICIPIO
prompt ==========================
prompt
create or replace synonym INTERATVI.MUNICIPIO
  for MSAF.MUNICIPIO;

prompt
prompt Creating synonym OPERACAO_APURACAO
prompt ==================================
prompt
create or replace synonym INTERATVI.OPERACAO_APURACAO
  for MSAF.OPERACAO_APURACAO;

prompt
prompt Creating synonym REGISTRO_ESTADUAL
prompt ==================================
prompt
create or replace synonym INTERATVI.REGISTRO_ESTADUAL
  for MSAF.REGISTRO_ESTADUAL;

prompt
prompt Creating synonym RELAC_TAB_GRUPO
prompt ================================
prompt
create or replace synonym INTERATVI.RELAC_TAB_GRUPO
  for MSAF.RELAC_TAB_GRUPO;

prompt
prompt Creating synonym X01_CONTABIL
prompt =============================
prompt
create or replace synonym INTERATVI.X01_CONTABIL
  for MSAF.X01_CONTABIL;

prompt
prompt Creating synonym X02_SALDOS
prompt ===========================
prompt
create or replace synonym INTERATVI.X02_SALDOS
  for MSAF.X02_SALDOS;

prompt
prompt Creating synonym X04_PESSOA_FIS_JUR
prompt ===================================
prompt
create or replace synonym INTERATVI.X04_PESSOA_FIS_JUR
  for MSAF.X04_PESSOA_FIS_JUR;

prompt
prompt Creating synonym X07_DOCTO_FISCAL
prompt =================================
prompt
create or replace synonym INTERATVI.X07_DOCTO_FISCAL
  for MSAF.X07_DOCTO_FISCAL;

prompt
prompt Creating synonym X08_BASE_MERC
prompt ==============================
prompt
create or replace synonym INTERATVI.X08_BASE_MERC
  for MSAF.X08_BASE_MERC;

prompt
prompt Creating synonym X08_ITENS_MERC
prompt ===============================
prompt
create or replace synonym INTERATVI.X08_ITENS_MERC
  for MSAF.X08_ITENS_MERC;

prompt
prompt Creating synonym X08_TRIB_MERC
prompt ==============================
prompt
create or replace synonym INTERATVI.X08_TRIB_MERC
  for MSAF.X08_TRIB_MERC;

prompt
prompt Creating synonym X09_BASE_SERV
prompt ==============================
prompt
create or replace synonym INTERATVI.X09_BASE_SERV
  for MSAF.X09_BASE_SERV;

prompt
prompt Creating synonym X09_ITENS_SERV
prompt ===============================
prompt
create or replace synonym INTERATVI.X09_ITENS_SERV
  for MSAF.X09_ITENS_SERV;

prompt
prompt Creating synonym X09_TRIB_SERV
prompt ==============================
prompt
create or replace synonym INTERATVI.X09_TRIB_SERV
  for MSAF.X09_TRIB_SERV;

prompt
prompt Creating synonym X145_CONTRIB_RET_FONTE
prompt =======================================
prompt
create or replace synonym INTERATVI.X145_CONTRIB_RET_FONTE
  for MSAF.X145_CONTRIB_RET_FONTE;

prompt
prompt Creating synonym X147_OPER_CRED
prompt ===============================
prompt
create or replace synonym INTERATVI.X147_OPER_CRED
  for MSAF.X147_OPER_CRED;

prompt
prompt Creating synonym X148_BENS_ATIVO_IMOB
prompt =====================================
prompt
create or replace synonym INTERATVI.X148_BENS_ATIVO_IMOB
  for MSAF.X148_BENS_ATIVO_IMOB;

prompt
prompt Creating synonym X176_PRT_CTA_CUSTO_F100
prompt ========================================
prompt
create or replace synonym INTERATVI.X176_PRT_CTA_CUSTO_F100
  for MSAF.X176_PRT_CTA_CUSTO_F100;

prompt
prompt Creating synonym X2002_PLANO_CONTAS
prompt ===================================
prompt
create or replace synonym INTERATVI.X2002_PLANO_CONTAS
  for MSAF.X2002_PLANO_CONTAS;

prompt
prompt Creating synonym X2005_TIPO_DOCTO
prompt =================================
prompt
create or replace synonym INTERATVI.X2005_TIPO_DOCTO
  for MSAF.X2005_TIPO_DOCTO;

prompt
prompt Creating synonym X2006_NATUREZA_OP
prompt ==================================
prompt
create or replace synonym INTERATVI.X2006_NATUREZA_OP
  for MSAF.X2006_NATUREZA_OP;

prompt
prompt Creating synonym X2007_MEDIDA
prompt =============================
prompt
create or replace synonym INTERATVI.X2007_MEDIDA
  for MSAF.X2007_MEDIDA;

prompt
prompt Creating synonym X2012_COD_FISCAL
prompt =================================
prompt
create or replace synonym INTERATVI.X2012_COD_FISCAL
  for MSAF.X2012_COD_FISCAL;

prompt
prompt Creating synonym X2013_PRODUTO
prompt ==============================
prompt
create or replace synonym INTERATVI.X2013_PRODUTO
  for MSAF.X2013_PRODUTO;

prompt
prompt Creating synonym X2018_SERVICOS
prompt ===============================
prompt
create or replace synonym INTERATVI.X2018_SERVICOS
  for MSAF.X2018_SERVICOS;

prompt
prompt Creating synonym X2019_COD_DARF
prompt ===============================
prompt
create or replace synonym INTERATVI.X2019_COD_DARF
  for MSAF.X2019_COD_DARF;

prompt
prompt Creating synonym X2024_MODELO_DOCTO
prompt ===================================
prompt
create or replace synonym INTERATVI.X2024_MODELO_DOCTO
  for MSAF.X2024_MODELO_DOCTO;

prompt
prompt Creating synonym X2043_COD_NBM
prompt ==============================
prompt
create or replace synonym INTERATVI.X2043_COD_NBM
  for MSAF.X2043_COD_NBM;

prompt
prompt Creating synonym X53_RETENCAO_IRRF
prompt ==================================
prompt
create or replace synonym INTERATVI.X53_RETENCAO_IRRF
  for MSAF.X53_RETENCAO_IRRF;

prompt
prompt Creating synonym Y2025_SIT_TRB_UF_A
prompt ===================================
prompt
create or replace synonym INTERATVI.Y2025_SIT_TRB_UF_A
  for MSAF.Y2025_SIT_TRB_UF_A;

prompt
prompt Creating synonym Y2026_SIT_TRB_UF_B
prompt ===================================
prompt
create or replace synonym INTERATVI.Y2026_SIT_TRB_UF_B
  for MSAF.Y2026_SIT_TRB_UF_B;

prompt
prompt Creating view APURACAO_AJUSTE_V
prompt ===============================
prompt
create or replace view interatvi.apuracao_ajuste_v as
select (k.COD_EMPRESA || k.COD_ESTAB || k.COD_TIPO_LIVRO ||
                 to_char(k.DAT_APURACAO, 'YYYYMMDD') || k.COD_OPER_APUR ||
                 k.NUM_DISCRIMINACAO) ID_APUR,
                 fil.id_filial,
                 fil.id_empresa,
                 'ICMREC' imposto,
                 k.cod_tipo_livro,
                 k.dat_apuracao,
                 k.cod_oper_apur,
                 l.dsc_oper_apur,
                 k.num_discriminacao,
                 k.val_item_discrim,
                 k.ind_dig_calculado,
                 k.cod_ajuste_icms,
                 k.cod_ajuste_ipi,
                 k.dsc_item_apuracao
            from item_apurac_discr k,
                 operacao_apuracao l,
                 estabelecimento   estab,
                 i005_filial            fil
           where 1 = 1
             and k.cod_tipo_livro    = l.cod_tipo_livro
             and k.cod_oper_apur     = l.cod_oper_apur
             and k.cod_empresa       = estab.cod_empresa
             and k.cod_estab         = estab.cod_estab
             and fil.cnpj            = estab.cgc
             /*and param.id_imposto    = imp.id_imposto
             and imp.cod_imposto     =  p_tpImposto
             and param.id_empresa    = fil.idempresa*/
             and k.val_item_discrim  > 0
             and k.cod_tipo_livro    = '108'
             and k.cod_oper_apur     in ('006', '003')
             /*and fil.idempresa       = p_iEmpresa
             and k.dat_apuracao between p_iDataIni
                                    and p_iDataFim*/
       --
       union all
       -- ICMS A RECOLHER
          select (k.COD_EMPRESA || k.COD_ESTAB || k.COD_TIPO_LIVRO ||
                 to_char(k.DAT_APURACAO, 'YYYYMMDD') || k.COD_OPER_APUR ||
                 k.NUM_DISCRIMINACAO) ID_APUR,
                 fil.id_filial,
                 fil.id_empresa,
                 'ICMPAG' imposto,
                 k.cod_tipo_livro,
                 k.dat_apuracao,
                 k.cod_oper_apur,
                 l.dsc_oper_apur,
                 k.num_discriminacao,
                 k.val_item_discrim,
                 k.ind_dig_calculado,
                 k.cod_ajuste_icms,
                 k.cod_ajuste_ipi,
                 k.dsc_item_apuracao
            from item_apurac_discr k,
                 operacao_apuracao l,
                 estabelecimento   estab,
                 i005_filial            fil
           where 1 = 1
             and k.cod_tipo_livro    = l.cod_tipo_livro
             and k.cod_oper_apur     = l.cod_oper_apur
             and k.cod_empresa       = estab.cod_empresa
             and k.cod_estab         = estab.cod_estab
             and fil.cnpj            = estab.cgc
            /* and param.id_imposto    = imp.id_imposto
             and imp.cod_imposto     =  p_tpImposto
             and param.id_empresa    = fil.idempresa*/
             and k.val_item_discrim  > 0
             and k.cod_tipo_livro    = '108'
             and k.cod_oper_apur     in ('002', '007')
            /* and fil.idempresa       = p_iEmpresa
             and k.dat_apuracao between p_iDataIni
                                    and p_iDataFim*/
            --
          union all
           -- IPI A RECUPERAR
          select (k.COD_EMPRESA || k.COD_ESTAB || k.COD_TIPO_LIVRO ||
                 to_char(k.DAT_APURACAO, 'YYYYMMDD') || k.COD_OPER_APUR ||
                 k.NUM_DISCRIMINACAO) ID_APUR,
                 fil.id_filial,
                 fil.id_empresa,
                 'IPIREC' imposto,
                 k.cod_tipo_livro,
                 k.dat_apuracao,
                 k.cod_oper_apur,
                 l.dsc_oper_apur,
                 k.num_discriminacao,
                 k.val_item_discrim,
                 k.ind_dig_calculado,
                 k.cod_ajuste_icms,
                 k.cod_ajuste_ipi,
                 k.dsc_item_apuracao
            from item_apurac_discr k,
                 operacao_apuracao l,
                 estabelecimento   estab,
                 i005_filial            fil
           where 1 = 1
             and k.cod_tipo_livro    = l.cod_tipo_livro
             and k.cod_oper_apur     = l.cod_oper_apur
             and k.cod_empresa       = estab.cod_empresa
             and k.cod_estab         = estab.cod_estab
             and fil.cnpj            = estab.cgc
             /*and param.id_imposto    = imp.id_imposto
             and imp.cod_imposto     =  p_tpImposto
             and param.id_empresa    = fil.idempresa*/
             and k.val_item_discrim  > 0
             and k.cod_tipo_livro    = '002'
             and k.cod_oper_apur     in ('005', '010')
             /*and fil.idempresa       = p_iEmpresa
             and k.dat_apuracao between p_iDataIni
                                    and p_iDataFim*/
          union all
           -- IPI A RECUPERAR
          select (k.COD_EMPRESA || k.COD_ESTAB || k.COD_TIPO_LIVRO ||
                 to_char(k.DAT_APURACAO, 'YYYYMMDD') || k.COD_OPER_APUR ||
                 k.NUM_DISCRIMINACAO) ID_APUR,
                 fil.id_filial,
                 fil.id_empresa,
                 'IPIPAG' imposto,
                 k.cod_tipo_livro,
                 k.dat_apuracao,
                 k.cod_oper_apur,
                 l.dsc_oper_apur,
                 k.num_discriminacao,
                 k.val_item_discrim,
                 k.ind_dig_calculado,
                 k.cod_ajuste_icms,
                 k.cod_ajuste_ipi,
                 k.dsc_item_apuracao
            from item_apurac_discr k,
                 operacao_apuracao l,
                 estabelecimento   estab,
                 i005_filial            fil
           where 1 = 1
             and k.cod_tipo_livro    = l.cod_tipo_livro
             and k.cod_oper_apur     = l.cod_oper_apur
             and k.cod_empresa       = estab.cod_empresa
             and k.cod_estab         = estab.cod_estab
             and fil.cnpj            = estab.cgc
             /*and param.id_imposto    = imp.id_imposto
             and imp.cod_imposto     =  p_tpImposto
             and param.id_empresa    = fil.idempresa*/
             and k.val_item_discrim  > 0
             and k.cod_tipo_livro    = '002'
             and k.cod_oper_apur     in ('004', '012')
             /*and fil.idempresa       = p_iEmpresa
             and k.dat_apuracao between p_iDataIni
                                    and p_iDataFim*/
          --
          union all
          -- PIS A RECUPERAR
          select ('M110' || ap.cod_empresa || ap.cod_estab || ap.cod_tipo_livro ||
                           to_char(ap.dat_apur_fim, 'YYYYMMDD') || ap.cod_layout ||
                           rg.ind_aj) ID_APUR,
                 fil.id_filial,
                 fil.id_empresa,
                 'PISREC' imposto,
                 ap.cod_tipo_livro,
                 ap.dat_apur_fim dat_apuracao,
                 'M110'          cod_oper_apur,
                 rg.dsc_aj       dsc_oper_apur,
                 1               num_discriminacao,
                 rg.vl_aj        val_item_discrim,
                 rg.ind_aj       ind_dig_calculado,
                 null            cod_ajuste_icms,
                 null            cod_ajuste_ipi,
                 decode(RG.ind_aj,
                 '0', '0 - Ajuste de redução',
                 '1', '1 - Ajuste de acréscimo') dsc_item_apuracao
            from epc_reg_ajt_m110_m510 rg,
                 epc_reg_ajt_m100_m500 aj,
                 epc_apuracao          ap,
                 estabelecimento    estab,
                 i005_filial          fil
           where 1=1
             and rg.id_reg_m100_m500 = aj.id_reg_m100_m500
             and aj.id_reg           = ap.id_reg
             and ap.cod_empresa      = estab.cod_empresa
             and ap.cod_estab        = estab.cod_estab
             and estab.cgc           = fil.cnpj
             /*and param.id_imposto    = imp.id_imposto
             and imp.cod_imposto     = p_tpImposto
             and param.id_empresa    = fil.idempresa*/
             and rg.cod_reg          = '110'
             and rg.vl_aj            > 0
             /*and fil.idempresa       = p_iEmpresa
             and ap.dat_apur_fim     between p_iDataIni
                                         and p_iDataFim*/
          --
          union all
          -- PIS A RECOLHER
          select ('M220' || ap.cod_empresa || ap.cod_estab || ap.cod_tipo_livro ||
                           to_char(ap.dat_apur_fim, 'YYYYMMDD') || ap.cod_layout ||
                           rg.ind_aj) ID_APUR,
                 fil.id_filial,
                 fil.id_empresa,
                 'PISPAG' imposto,
                 ap.cod_tipo_livro,
                 ap.dat_apur_fim dat_apuracao,
                 'M220'          cod_oper_apur,
                 rg.dsc_aj       dsc_oper_apur,
                 1               num_discriminacao,
                 rg.vl_aj        val_item_discrim,
                 rg.ind_aj       ind_dig_calculado,
                 null            cod_ajuste_icms,
                 null            cod_ajuste_ipi,
                 decode(RG.ind_aj,
                 '0', '0 - Ajuste de redução',
                 '1', '1 - Ajuste de acréscimo') dsc_item_apuracao
            from epc_reg_ajt_m110_m510 rg,
                 epc_reg_ajt_m100_m500 aj,
                 epc_apuracao          ap,
                 estabelecimento    estab,
                 i005_filial          fil
           where 1=1
             and rg.id_reg_m100_m500 = aj.id_reg_m100_m500
             and aj.id_reg           = ap.id_reg
             and ap.cod_empresa      = estab.cod_empresa
             and ap.cod_estab        = estab.cod_estab
             and estab.cgc           = fil.cnpj
             /*and param.id_imposto    = imp.id_imposto
             and imp.cod_imposto     = p_tpImposto
             and param.id_empresa    = fil.idempresa*/
             and rg.cod_reg          = '220'
             and rg.vl_aj            > 0
            /* and fil.idempresa       = p_iEmpresa
             and ap.dat_apur_fim     between p_iDataIni
                                         and p_iDataFim*/
          --
          union all
          -- COFINS A RECUPERAR
          select ('M510' || ap.cod_empresa || ap.cod_estab || ap.cod_tipo_livro ||
                           to_char(ap.dat_apur_fim, 'YYYYMMDD') || ap.cod_layout ||
                           rg.ind_aj) ID_APUR,
                 fil.id_filial,
                 fil.id_empresa,
                 'COFREC' imposto,
                 ap.cod_tipo_livro,
                 ap.dat_apur_fim dat_apuracao,
                 'M510'          cod_oper_apur,
                 rg.dsc_aj       dsc_oper_apur,
                 1               num_discriminacao,
                 rg.vl_aj        val_item_discrim,
                 rg.ind_aj       ind_dig_calculado,
                 null            cod_ajuste_icms,
                 null            cod_ajuste_ipi,
                 decode(RG.ind_aj,
                 '0', '0 - Ajuste de redução',
                 '1', '1 - Ajuste de acréscimo') dsc_item_apuracao
            from epc_reg_ajt_m110_m510 rg,
                 epc_reg_ajt_m100_m500 aj,
                 epc_apuracao          ap,
                 estabelecimento    estab,
                 i005_filial          fil
           where 1=1
             and rg.id_reg_m100_m500 = aj.id_reg_m100_m500
             and aj.id_reg           = ap.id_reg
             and ap.cod_empresa      = estab.cod_empresa
             and ap.cod_estab        = estab.cod_estab
             and estab.cgc           = fil.cnpj
             /*and param.id_imposto    = imp.id_imposto
             and imp.cod_imposto     = p_tpImposto
             and param.id_empresa    = fil.idempresa*/
             and rg.cod_reg          = '510'
             and rg.vl_aj            > 0
             /*and fil.idempresa       = p_iEmpresa
             and ap.dat_apur_fim     between p_iDataIni
                                         and p_iDataFim*/
          --
          union all
          -- COFINS A RECOLHER
          select ('M620' || ap.cod_empresa || ap.cod_estab || ap.cod_tipo_livro ||
                           to_char(ap.dat_apur_fim, 'YYYYMMDD') || ap.cod_layout ||
                           rg.ind_aj) ID_APUR,
                 fil.id_filial,
                 fil.id_empresa,
                 'COFPAG' imposto,
                 ap.cod_tipo_livro,
                 ap.dat_apur_fim dat_apuracao,
                 'M620'          cod_oper_apur,
                 rg.dsc_aj       dsc_oper_apur,
                 1               num_discriminacao,
                 rg.vl_aj        val_item_discrim,
                 rg.ind_aj       ind_dig_calculado,
                 null            cod_ajuste_icms,
                 null            cod_ajuste_ipi,
                 decode(RG.ind_aj,
                 '0', '0 - Ajuste de redução',
                 '1', '1 - Ajuste de acréscimo') dsc_item_apuracao
            from epc_reg_ajt_m110_m510 rg,
                 epc_reg_ajt_m100_m500 aj,
                 epc_apuracao          ap,
                 estabelecimento    estab,
                 i005_filial          fil
           where 1=1
             and rg.id_reg_m100_m500 = aj.id_reg_m100_m500
             and aj.id_reg           = ap.id_reg
             and ap.cod_empresa      = estab.cod_empresa
             and ap.cod_estab        = estab.cod_estab
             and estab.cgc           = fil.cnpj
            /* and param.id_imposto    = imp.id_imposto
             and imp.cod_imposto     = p_tpImposto
             and param.id_empresa    = fil.idempresa*/
             and rg.cod_reg          = '620'
             and rg.vl_aj            > 0
             /*and fil.idempresa       = p_iEmpresa
             and ap.dat_apur_fim     between p_iDataIni
                                         and p_iDataFim*/;

prompt
prompt Creating view DOCTO_PROC_V
prompt ==========================
prompt
create or replace view interatvi.docto_proc_v as
select nf.id_nf id_docto,
       nf.id_empresa,
       nf.id_filial,
       nf.num_nf num_docto,
       nf.data_e_s data_docto,
       nf.ind_oper movto,
       SUM(itx.vlr_tributo) vlr_tributo,
       'NF' origem,
       nf.num_lancto,
       param.cod_conta,
       param.id_imposto,
       imp.cod_imposto,
       null justificativa,
       '1'  Id_Class
from i200_nota_fiscal  nf,
     i201_nf_item      it,
     i202_item_imposto itx,
     i015_imposto      imp,
     i500_param_conta  param
where 1=1
  and nf.id_nf        = it.id_nf
  and it.id_nf        = itx.id_nf
  and it.num_item     = itx.num_item
  and nf.id_empresa   = param.id_empresa
  and itx.id_imposto  = imp.id_imposto
  and imp.id_imposto  = param.id_imposto
--  and nf.num_lancto   = '2001046020'
  /*and imp.cod_imposto = 'ICMREC'
  and nf.id_empresa   = '1'
  and nf.data_e_s     between '01/08/2018'
                          and '31/08/2018'*/
GROUP BY nf.id_nf,
       nf.id_empresa,
       nf.id_filial,
       nf.num_nf,
       nf.data_e_s,
       nf.ind_oper,
       nf.num_lancto,
       param.cod_conta,
       param.id_imposto,
       imp.cod_imposto;

prompt
prompt Creating view EFD_ATIVO_V
prompt =========================
prompt
create or replace view interatvi.efd_ativo_v as
select (k.cod_empresa || k.cod_estab || k.ind_oper_cred || k.cod_bem ||
             to_char(k.data_lancto, 'YYYYMMDD') || k.ind_origem_cred_bem || k.cod_inc_bem || 'PISREC' ) id_ativo,
             k.cod_empresa,
             k.cod_estab,
             fil.id_empresa,
             fil.id_filial,
             'PISREC' imposto,
             k.ind_oper_cred,
             k.cod_bem,
             k.cod_inc_bem,
             k.data_lancto,
             k.ind_origem_cred_bem,
             k.vlr_bem_ativo_imob,
             k.cod_sit_pis cst,
             k.vlr_base_pis vlr_base,
             k.vlr_aliq_pis vlr_aliq,
             k.vlr_pis vlr_tributo,
             k.vlr_parcela_dep_mes
        from x148_bens_ativo_imob k,
             estabelecimento      estab,
             i005_filial          fil
       where 1 = 1
         and k.cod_empresa = estab.cod_empresa
         and k.cod_estab = estab.cod_estab
         and fil.cnpj = estab.cgc
         and k.vlr_pis > 0
         /*and fil.idempresa = '1'
         and k.data_lancto between '01/01/2017' and '31/08/2018'*/
 union all
      select (k.cod_empresa || k.cod_estab || k.ind_oper_cred || k.cod_bem ||
             to_char(k.data_lancto, 'YYYYMMDD') || k.ind_origem_cred_bem || k.cod_inc_bem || 'COFREC') id_ativo,
             k.cod_empresa,
             k.cod_estab,
             fil.id_empresa,
             fil.id_filial,
             'COFREC' imposto,
             k.ind_oper_cred,
             k.cod_bem,
             k.cod_inc_bem,
             k.data_lancto,
             k.ind_origem_cred_bem,
             k.vlr_bem_ativo_imob,
             k.cod_sit_cofins cst,
             k.vlr_base_cofins vlr_base,
             k.vlr_aliq_cofins vlr_aliq,
             k.vlr_cofins vlr_tributo,
             k.vlr_parcela_dep_mes
        from x148_bens_ativo_imob k,
             estabelecimento      estab,
             i005_filial          fil
       where 1 = 1
         and k.cod_empresa = estab.cod_empresa
         and k.cod_estab = estab.cod_estab
         and fil.cnpj = estab.cgc
         and k.vlr_cofins > 0
         /*and fil.idempresa = '1'
         and k.data_lancto between '01/01/2017' and '31/08/2018' */;

prompt
prompt Creating view F100_COFINS_V
prompt ===========================
prompt
create or replace view interatvi.f100_cofins_v as
select (l.cod_docto || k.cod_empresa || k.cod_estab ||
               to_char(k.data_oper, 'YYYYMMDD') || k.num_docto || k.serie ||
               k.num_lancto || x2002.cod_conta || 'COFREC') id_outros,
               k.cod_empresa,
               k.cod_estab,
               k.data_oper,
               fil.id_empresa,
               fil.id_filial,
               'COFREC' imposto,
               l.cod_docto,
               m.cod_fis_jur,
               k.num_docto,
               k.serie,
               k.num_lancto,
               k.vlr_oper,
               f100.cod_trib_cofins cst,
               k.vlr_base_cofins vlr_base,
               k.vlr_aliq_cofins vlr_aliq,
               k.vlr_cofins vlr_tributo,
               k.DISCRI_OPER
          from x147_oper_cred     k,
               x2005_tipo_docto   l,
               x04_pessoa_fis_jur m,
               estabelecimento    estab,
               i005_filial        fil,
               x2002_plano_contas x2002,
               X176_PRT_CTA_CUSTO_F100 f100,
               EFD_DADOS_INICIAIS_PISCOF di
         where 1 = 1
           and k.cod_empresa        = estab.cod_empresa
           and k.cod_estab          = estab.cod_estab
           and k.ident_docto        = l.ident_docto(+)
           and k.ident_fis_jur      = m.ident_fis_jur(+)
           and k.ident_conta        = x2002.ident_conta
           and nvl(k.ident_custo, 0)  = decode(f100.ident_custo, null, nvl(k.ident_custo, 0))
           and k.ident_conta          = f100.ident_conta
           and k.cod_empresa          = f100.cod_empresa
           and k.cod_estab            = f100.cod_estab
           and f100.ind_tp_oper       = '0'
           and f100.cod_empresa       = di.cod_empresa
           and f100.cod_estab         = di.cod_estab
           and di.ind_tp_param_f100   = 'C'
           and fil.cnpj               = estab.cgc
           and k.vlr_cofins              > 0
           /*and fil.idempresa          = '1'
           and k.data_oper           between '01/01/2018' and '31/08/2018'*/
       union all
        select (l.cod_docto || k.cod_empresa || k.cod_estab ||
               to_char(k.data_oper, 'YYYYMMDD') || k.num_docto || k.serie ||
               k.num_lancto || 'COFREC') id_outros,
               k.cod_empresa,
               k.cod_estab,
               k.data_oper,
               fil.id_empresa,
               fil.id_filial,
               'COFREC' imposto,
               l.cod_docto,
               m.cod_fis_jur,
               k.num_docto,
               k.serie,
               k.num_lancto,
               k.vlr_oper,
               f100.cod_trib_cofins cst,
               k.vlr_base_cofins vlr_base,
               k.vlr_aliq_cofins vlr_aliq,
               k.vlr_cofins vlr_tributo,
               k.DISCRI_OPER
          from x147_oper_cred     k,
               x2005_tipo_docto   l,
               x04_pessoa_fis_jur m,
               estabelecimento    estab,
               i005_filial        fil,
               EPC_TP_DOC_CSTOPNAT f100,
               EFD_DADOS_INICIAIS_PISCOF di
         where 1 = 1
           and k.cod_empresa        = estab.cod_empresa
           and k.cod_estab          = estab.cod_estab
           and k.ident_docto        = l.ident_docto(+)
           and k.ident_fis_jur      = m.ident_fis_jur(+)
           and k.ident_docto        = f100.ident_docto
           and k.cod_empresa        = f100.cod_empresa
           and k.cod_estab          = f100.cod_estab
           and f100.tp_operacao     = '0'
           and f100.cod_empresa     = di.cod_empresa
           and f100.cod_estab       = di.cod_estab
           and di.ind_tp_param_f100 = 'D'
           and fil.cnpj             = estab.cgc
           and k.vlr_cofins            > 0
           /*and fil.idempresa        = '1'
           and k.data_oper between '01/01/2018' and '31/08/2018'*/
     union all
     -- COFINS A RECOLHER
        select (l.cod_docto || k.cod_empresa || k.cod_estab ||
               to_char(k.data_oper, 'YYYYMMDD') || k.num_docto || k.serie ||
               k.num_lancto || x2002.cod_conta || 'COFPAG') id_outros,
               k.cod_empresa,
               k.cod_estab,
               k.data_oper,
               fil.id_empresa,
               fil.id_filial,
               'COFPAG' imposto,
               l.cod_docto,
               m.cod_fis_jur,
               k.num_docto,
               k.serie,
               k.num_lancto,
               k.vlr_oper,
               f100.cod_trib_pis cst,
               k.vlr_base_cofins vlr_base,
               k.vlr_aliq_cofins vlr_aliq,
               k.vlr_cofins vlr_tributo,
               k.DISCRI_OPER
          from x147_oper_cred     k,
               x2005_tipo_docto   l,
               x04_pessoa_fis_jur m,
               estabelecimento    estab,
               i005_filial        fil,
               x2002_plano_contas x2002,
               X176_PRT_CTA_CUSTO_F100 f100,
               EFD_DADOS_INICIAIS_PISCOF di
         where 1 = 1
           and k.cod_empresa        = estab.cod_empresa
           and k.cod_estab          = estab.cod_estab
           and k.ident_docto        = l.ident_docto(+)
           and k.ident_fis_jur      = m.ident_fis_jur(+)
           and k.ident_conta        = x2002.ident_conta
           and nvl(k.ident_custo, 0)  = decode(f100.ident_custo, null, nvl(k.ident_custo, 0))
           and k.ident_conta          = f100.ident_conta
           and k.cod_empresa          = f100.cod_empresa
           and k.cod_estab            = f100.cod_estab
           and f100.ind_tp_oper       = '1'
           and f100.cod_empresa       = di.cod_empresa
           and f100.cod_estab         = di.cod_estab
           and di.ind_tp_param_f100   = 'C'
           and fil.cnpj               = estab.cgc
           and k.vlr_cofins              > 0
           /*and fil.idempresa          = '1'
           and k.data_oper           between '01/01/2018' and '31/08/2018'*/
       union all
        select (l.cod_docto || k.cod_empresa || k.cod_estab ||
               to_char(k.data_oper, 'YYYYMMDD') || k.num_docto || k.serie ||
               k.num_lancto || 'COFPAG') id_outros,
               k.cod_empresa,
               k.cod_estab,
               k.data_oper,
               fil.id_empresa,
               fil.id_filial,
               'COFPAG' imposto,
               l.cod_docto,
               m.cod_fis_jur,
               k.num_docto,
               k.serie,
               k.num_lancto,
               k.vlr_oper,
               f100.cod_trib_cofins cst,
               k.vlr_base_cofins vlr_base,
               k.vlr_aliq_cofins vlr_aliq,
               k.vlr_cofins vlr_tributo,
               k.DISCRI_OPER
          from x147_oper_cred     k,
               x2005_tipo_docto   l,
               x04_pessoa_fis_jur m,
               estabelecimento    estab,
               i005_filial        fil,
               EPC_TP_DOC_CSTOPNAT f100,
               EFD_DADOS_INICIAIS_PISCOF di
         where 1 = 1
           and k.cod_empresa        = estab.cod_empresa
           and k.cod_estab          = estab.cod_estab
           and k.ident_docto        = l.ident_docto(+)
           and k.ident_fis_jur      = m.ident_fis_jur(+)
           and k.ident_docto        = f100.ident_docto
           and k.cod_empresa        = f100.cod_empresa
           and k.cod_estab          = f100.cod_estab
           and f100.tp_operacao     = '1'
           and f100.cod_empresa     = di.cod_empresa
           and f100.cod_estab       = di.cod_estab
           and di.ind_tp_param_f100 = 'D'
           and fil.cnpj             = estab.cgc
           and k.vlr_cofins            > 0
           /*and fil.idempresa        = '1'
           and k.data_oper between '01/01/2018' and '31/08/2018';*/;

prompt
prompt Creating view F100_PIS_V
prompt ========================
prompt
create or replace view interatvi.f100_pis_v as
select (l.cod_docto || k.cod_empresa || k.cod_estab ||
               to_char(k.data_oper, 'YYYYMMDD') || k.num_docto || k.serie ||
               k.num_lancto || x2002.cod_conta || 'PISREC') id_outros,
               k.cod_empresa,
               k.cod_estab,
               k.data_oper,
               fil.id_empresa,
               fil.id_filial,
               'PISREC' imposto,
               l.cod_docto,
               m.cod_fis_jur,
               k.num_docto,
               k.serie,
               k.num_lancto,
               k.vlr_oper,
               f100.cod_trib_pis cst,
               k.vlr_base_pis vlr_base,
               k.vlr_aliq_pis vlr_aliq,
               k.vlr_pis vlr_tributo,
               k.DISCRI_OPER
          from x147_oper_cred     k,
               x2005_tipo_docto   l,
               x04_pessoa_fis_jur m,
               estabelecimento    estab,
               i005_filial        fil,
               x2002_plano_contas x2002,
               X176_PRT_CTA_CUSTO_F100 f100,
               EFD_DADOS_INICIAIS_PISCOF di
         where 1 = 1
           and k.cod_empresa        = estab.cod_empresa
           and k.cod_estab          = estab.cod_estab
           and k.ident_docto        = l.ident_docto(+)
           and k.ident_fis_jur      = m.ident_fis_jur(+)
           and k.ident_conta        = x2002.ident_conta
           and nvl(k.ident_custo, 0)  = decode(f100.ident_custo, null, nvl(k.ident_custo, 0))
           and k.ident_conta          = f100.ident_conta
           and k.cod_empresa          = f100.cod_empresa
           and k.cod_estab            = f100.cod_estab
           and f100.ind_tp_oper       = '0'
           and f100.cod_empresa       = di.cod_empresa
           and f100.cod_estab         = di.cod_estab
           and di.ind_tp_param_f100   = 'C'
           and fil.cnpj               = estab.cgc
           and k.vlr_pis              > 0
           /*and fil.idempresa          = '1'
           and k.data_oper           between '01/01/2018' and '31/08/2018'*/
       union all
        select (l.cod_docto || k.cod_empresa || k.cod_estab ||
               to_char(k.data_oper, 'YYYYMMDD') || k.num_docto || k.serie ||
               k.num_lancto || 'PISREC') id_outros,
               k.cod_empresa,
               k.cod_estab,
               k.data_oper,
               fil.id_empresa,
               fil.id_filial,
               'PISREC' imposto,
               l.cod_docto,
               m.cod_fis_jur,
               k.num_docto,
               k.serie,
               k.num_lancto,
               k.vlr_oper,
               f100.cod_trib_pis cst,
               k.vlr_base_pis vlr_base,
               k.vlr_aliq_pis vlr_aliq,
               k.vlr_pis vlr_tributo,
               k.DISCRI_OPER
          from x147_oper_cred     k,
               x2005_tipo_docto   l,
               x04_pessoa_fis_jur m,
               estabelecimento    estab,
               i005_filial        fil,
               EPC_TP_DOC_CSTOPNAT f100,
               EFD_DADOS_INICIAIS_PISCOF di
         where 1 = 1
           and k.cod_empresa        = estab.cod_empresa
           and k.cod_estab          = estab.cod_estab
           and k.ident_docto        = l.ident_docto(+)
           and k.ident_fis_jur      = m.ident_fis_jur(+)
           and k.ident_docto        = f100.ident_docto
           and k.cod_empresa        = f100.cod_empresa
           and k.cod_estab          = f100.cod_estab
           and f100.tp_operacao     = '0'
           and f100.cod_empresa     = di.cod_empresa
           and f100.cod_estab       = di.cod_estab
           and di.ind_tp_param_f100 = 'D'
           and fil.cnpj             = estab.cgc
         --  and fil.id_empresa        = '1'
           /*and k.vlr_pis            > 0
           and k.data_oper between '01/01/2018' and '31/08/2018'*/
     union all
     -- PIS A RECOLHER
        select (l.cod_docto || k.cod_empresa || k.cod_estab ||
               to_char(k.data_oper, 'YYYYMMDD') || k.num_docto || k.serie ||
               k.num_lancto || x2002.cod_conta || 'PISPAG') id_outros,
               k.cod_empresa,
               k.cod_estab,
               k.data_oper,
               fil.id_empresa,
               fil.id_filial,
               'PISPAG' imposto,
               l.cod_docto,
               m.cod_fis_jur,
               k.num_docto,
               k.serie,
               k.num_lancto,
               k.vlr_oper,
               f100.cod_trib_pis cst,
               k.vlr_base_pis vlr_base,
               k.vlr_aliq_pis vlr_aliq,
               k.vlr_pis vlr_tributo,
               k.DISCRI_OPER
          from x147_oper_cred     k,
               x2005_tipo_docto   l,
               x04_pessoa_fis_jur m,
               estabelecimento    estab,
               i005_filial        fil,
               x2002_plano_contas x2002,
               X176_PRT_CTA_CUSTO_F100 f100,
               EFD_DADOS_INICIAIS_PISCOF di
         where 1 = 1
           and k.cod_empresa        = estab.cod_empresa
           and k.cod_estab          = estab.cod_estab
           and k.ident_docto        = l.ident_docto(+)
           and k.ident_fis_jur      = m.ident_fis_jur(+)
           and k.ident_conta        = x2002.ident_conta
           and nvl(k.ident_custo, 0)  = decode(f100.ident_custo, null, nvl(k.ident_custo, 0))
           and k.ident_conta          = f100.ident_conta
           and k.cod_empresa          = f100.cod_empresa
           and k.cod_estab            = f100.cod_estab
           and f100.ind_tp_oper       = '1'
           and f100.cod_empresa       = di.cod_empresa
           and f100.cod_estab         = di.cod_estab
           and di.ind_tp_param_f100   = 'C'
           and fil.cnpj               = estab.cgc
     --      and fil.idempresa          = '1'
           /*and k.vlr_pis              > 0
           and k.data_oper           between '01/01/2018' and '31/08/2018'*/
       union all
        select (l.cod_docto || k.cod_empresa || k.cod_estab ||
               to_char(k.data_oper, 'YYYYMMDD') || k.num_docto || k.serie ||
               k.num_lancto || 'PISPAG') id_outros,
               k.cod_empresa,
               k.cod_estab,
               k.data_oper,
               fil.id_empresa,
               fil.id_filial,
               'PISPAG' imposto,
               l.cod_docto,
               m.cod_fis_jur,
               k.num_docto,
               k.serie,
               k.num_lancto,
               k.vlr_oper,
               f100.cod_trib_pis cst,
               k.vlr_base_pis vlr_base,
               k.vlr_aliq_pis vlr_aliq,
               k.vlr_pis vlr_tributo,
               k.DISCRI_OPER
          from x147_oper_cred     k,
               x2005_tipo_docto   l,
               x04_pessoa_fis_jur m,
               estabelecimento    estab,
               i005_filial        fil,
               EPC_TP_DOC_CSTOPNAT f100,
               EFD_DADOS_INICIAIS_PISCOF di
         where 1 = 1
           and k.cod_empresa        = estab.cod_empresa
           and k.cod_estab          = estab.cod_estab
           and k.ident_docto        = l.ident_docto(+)
           and k.ident_fis_jur      = m.ident_fis_jur(+)
           and k.ident_docto        = f100.ident_docto
           and k.cod_empresa        = f100.cod_empresa
           and k.cod_estab          = f100.cod_estab
           and f100.tp_operacao     = '1'
           and f100.cod_empresa     = di.cod_empresa
           and f100.cod_estab       = di.cod_estab
           and di.ind_tp_param_f100 = 'D'
           and fil.cnpj             = estab.cgc
           and k.vlr_pis            > 0
           /*and fil.idempresa        = '1'
           and k.data_oper between '01/01/2018' and '31/08/2018'*/;

prompt
prompt Creating view IDOCTO_PROC_V
prompt ===========================
prompt
create or replace view interatvi.idocto_proc_v as
select nf.id_nf id_docto,
       nf.id_empresa,
       nf.id_filial,
       nf.num_nf num_docto,
       nf.data_e_s data_docto,
       nf.ind_oper movto,
       SUM(itx.vlr_tributo) vlr_tributo,
       'I200' origem,
       nf.num_lancto,
       param.cod_conta,
       param.id_imposto,
       null justificativa,
       '1' Id_Class
  from i200_nota_fiscal  nf,
       i201_nf_item      it,
       i202_item_imposto itx,
       i015_imposto      imp,
       i500_param_conta  param
 where 1 = 1
   and nf.id_nf = it.id_nf
   and it.id_nf = itx.id_nf
   and it.num_item = itx.num_item
   and nf.id_empresa = param.id_empresa
   and itx.id_imposto = imp.id_imposto
   and imp.id_imposto = param.id_imposto
      --  and nf.num_lancto   = '2001046020'
      --  and imp.cod_imposto = 'ICMPAG'
  /* and nf.id_empresa = '1'
   and nf.data_e_s between '01/08/2018' and '31/08/2018'*/
 GROUP BY nf.id_nf,
          nf.id_empresa,
          nf.id_filial,
          nf.num_nf,
          nf.data_e_s,
          nf.ind_oper,
          nf.num_lancto,
          param.cod_conta,
          param.id_imposto
union all
--insert into i803_docto_proc value
-- RENTENCAO
select ret.id_docto,
       ret.id_empresa,
       ret.id_filial,
       ret.num_docto,
       ret.data_fato_gerador data_docto,
       ret.movto movto,
       ret.vlr_retencao,
       'I210' origem,
       ret.num_lancto,
       param.cod_conta,
       param.id_imposto,
       null justificativa,
       '1' Id_Class
  from i210_retencoes   ret,
       i016_cod_darf    darf,
       i015_imposto     imp,
       i500_param_conta param
 where 1 = 1
   and ret.cod_darf = darf.cod_darf
   and darf.id_imposto = imp.id_imposto
   and imp.id_imposto = param.id_imposto
   and param.id_empresa = ret.id_empresa
   /*and imp.cod_imposto = 'IRRF'
   and ret.id_empresa = '1'
   and ret.data_fato_gerador between '01/08/2018' and '31/08/2018'*/
--
union all
-- APURACAO
select apur.id_lancto_apuracao id_docto,
       apur.id_empresa,
       apur.id_filial,
       null num_docto,
       apur.data_apur data_docto,
       '0' movto,
       apur.vlr_apur vlr_retencao,
       'I220' origem,
       null num_lancto,
       param.cod_conta,
       param.id_imposto,
       null justificativa,
       '1' Id_Class
  from i220_lancto_apuracao apur, i015_imposto imp, i500_param_conta param
 where 1 = 1
   and apur.id_imposto = imp.id_imposto
   and imp.id_imposto = param.id_imposto
   and apur.id_empresa = param.id_empresa
 --  and imp.cod_imposto = 'ICMREC'
   and apur.cod_oper_apur in ('003', '006')
   /*and apur.id_empresa = '1'
   and apur.data_apur between '01/08/2018' and '31/08/2018'*/
union all
select apur.id_lancto_apuracao id_docto,
       apur.id_empresa,
       apur.id_filial,
       null num_docto,
       apur.data_apur data_docto,
       '1' movto,
       apur.vlr_apur vlr_retencao,
       'I220' origem,
       null num_lancto,
       param.cod_conta,
       param.id_imposto,
       null justificativa,
       '1' Id_Class
  from i220_lancto_apuracao apur, i015_imposto imp, i500_param_conta param
 where 1 = 1
   and apur.id_imposto = imp.id_imposto
   and imp.id_imposto = param.id_imposto
   and apur.id_empresa = param.id_empresa
 --  and imp.cod_imposto = 'ICMREC'
   and apur.cod_oper_apur in ('002', '007')
   /*and apur.id_empresa = '1'
   and apur.data_apur between '01/08/2018' and '31/08/2018'*/
--
union all
-- ATIVO
select atv.id_docto_ativo id_docto,
       atv.id_empresa,
       atv.id_filial,
       NULL  num_docto,
       atv.data_parcela data_docto,
       '0' movto,
       atv.vlr_tributo vlr_retencao,
       'I203' origem,
       atv.num_lancto num_lancto,
       param.cod_conta,
       param.id_imposto,
       null justificativa,
       '1' Id_Class
  from i203_ativo atv, i015_imposto imp, i500_param_conta param
 where 1 = 1
   and atv.id_imposto = imp.id_imposto
   and imp.id_imposto = param.id_imposto
   and atv.id_empresa = param.id_empresa
   /*and imp.cod_imposto = 'ICMREC'
   and atv.id_empresa = '1'
   and atv.data_parcela between '01/08/2018' and '31/08/2018'*/
--
union all
-- OUTROS
select oth.id_docto,
       oth.id_empresa,
       oth.id_filial,
       oth.num_docto,
       oth.data_docto,
       '0' movto,
       oth.vlr_tributo vlr_retencao,
       'I204' origem,
       oth.num_lancto num_lancto,
       param.cod_conta,
       param.id_imposto,
       null justificativa,
       '1' Id_Class
  from i204_outros_doctos oth, i015_imposto imp, i500_param_conta param
 where 1 = 1
   and oth.id_imposto = imp.id_imposto
   and imp.id_imposto = param.id_imposto
   and oth.id_empresa = param.id_empresa
   /*and imp.cod_imposto = 'ICMREC'
   and oth.id_empresa = '1'
   and oth.data_docto between '01/08/2018' and '31/08/2018'*/;

prompt
prompt Creating view IMPOSTOS_NF_V
prompt ===========================
prompt
create or replace view interatvi.impostos_nf_v as
select distinct
                 (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                 to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s || x7.norm_dev ||
                 x7.num_docfis || x7.serie_docfis || x7.sub_serie_docfis ||
                 x4.ind_fis_jur || x4.cod_fis_jur || x7.situacao) ID_NF,
                 fil.id_empresa,
                 fil.id_filial,
                 x7.data_fiscal,
                 x7.ident_docto_fiscal,
                 x8.num_item,
                 'ICMREC' imposto,
                 '1' Ind_tributacao,
                 x8.vlr_base_icms_1 vlr_base,
                 x8.aliq_tributo_icms vlr_aliq,
                 x8.vlr_tributo_icms vlr_tributo,
                 cst_icms.cod_situacao_b cst
            from dwt_docto_fiscal   x7,
                 dwt_itens_merc     x8,
                 x2013_produto      prod,
                 x2043_cod_nbm      nbm,
                 y2026_sit_trb_uf_b cst_icms,
                 x04_pessoa_fis_jur x4,
                 x2005_tipo_docto   x2005,
                 estabelecimento   estab,
                 i005_filial       fil
           where 1 = 1
             and x7.ident_docto_fiscal = x8.ident_docto_fiscal
             and x7.ident_fis_jur = x4.ident_fis_jur
             and x7.ident_docto = x2005.ident_docto
             and x8.ident_produto = prod.ident_produto
             and x8.ident_nbm = nbm.ident_nbm
             and x8.ident_situacao_b = cst_icms.ident_situacao_b
          --   and x7.ident_docto_fiscal = '299250'
             and x7.cod_empresa = estab.cod_empresa
             and x7.cod_estab   = estab.cod_estab
             and x7.situacao      = 'N'
             and estab.cgc      = fil.cnpj
             and x7.cod_class_doc_fis  = '1'
             and x8.vlr_tributo_icms > 0
             and (x7.movto_e_s   <> '9' or
                 (x7.movto_e_s   = '9' and x7.norm_dev = '2'))
                 --
          union all
                 -- ICMS A RECOLHER
           select distinct
                 (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                 to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s || x7.norm_dev ||
                 x7.num_docfis || x7.serie_docfis || x7.sub_serie_docfis ||
                 x4.ind_fis_jur || x4.cod_fis_jur || x7.situacao) ID_NF,
                 fil.id_empresa,
                 fil.id_filial,
                 x7.data_fiscal,
                 x7.ident_docto_fiscal,
                 x8.num_item,
                 'ICMPAG' imposto,
                 '1' Ind_tributacao,
                 x8.vlr_base_icms_1 vlr_base,
                 x8.aliq_tributo_icms vlr_aliq,
                 x8.vlr_tributo_icms vlr_tributo,
                 cst_icms.cod_situacao_b cst
            from dwt_docto_fiscal   x7,
                 dwt_itens_merc     x8,
                 x2013_produto      prod,
                 x2043_cod_nbm      nbm,
                 y2026_sit_trb_uf_b cst_icms,
                 x04_pessoa_fis_jur x4,
                 x2005_tipo_docto   x2005,
                 estabelecimento   estab,
                 i005_filial         fil
           where 1 = 1
             and x7.ident_docto_fiscal = x8.ident_docto_fiscal
             and x7.ident_fis_jur = x4.ident_fis_jur
             and x7.ident_docto = x2005.ident_docto
             and x8.ident_produto = prod.ident_produto
             and x8.ident_nbm = nbm.ident_nbm
             and x8.ident_situacao_b = cst_icms.ident_situacao_b
          --   and x7.ident_docto_fiscal = '299250'
             and x7.cod_empresa = estab.cod_empresa
             and x7.cod_estab   = estab.cod_estab
             and x7.situacao      = 'N'
             and estab.cgc      = fil.cnpj
             and x7.cod_class_doc_fis  = '1'
             and nvl(x8.vlr_tributo_icms, 0) > 0
             and (x7.movto_e_s   = '9' or
                 (x7.movto_e_s   <> '9' and x7.norm_dev = '2'))
                 --
          union all
                 -- ICMS DIFAL
           select distinct
                 (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                 to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s || x7.norm_dev ||
                 x7.num_docfis || x7.serie_docfis || x7.sub_serie_docfis ||
                 x4.ind_fis_jur || x4.cod_fis_jur || x7.situacao) ID_NF,
                 fil.id_empresa,
                 fil.id_filial,
                 x7.data_fiscal,
                 x7.ident_docto_fiscal,
                 x8.num_item,
                 'ICMDIF' imposto,
                 '1' Ind_tributacao,
                 x8.vlr_contab_item vlr_base,
                 x8.aliq_tributo_icms vlr_aliq,
                 x8.vlr_outros1 vlr_tributo,
                 cst_icms.cod_situacao_b cst
            from dwt_docto_fiscal   x7,
                 dwt_itens_merc     x8,
                 x2013_produto      prod,
                 x2043_cod_nbm      nbm,
                 y2026_sit_trb_uf_b cst_icms,
                 x04_pessoa_fis_jur x4,
                 x2005_tipo_docto   x2005,
                 estabelecimento   estab,
                 i005_filial       fil
           where 1 = 1
             and x7.ident_docto_fiscal = x8.ident_docto_fiscal
             and x7.ident_fis_jur = x4.ident_fis_jur
             and x7.ident_docto = x2005.ident_docto
             and x8.ident_produto = prod.ident_produto
             and x8.ident_nbm = nbm.ident_nbm
             and x8.ident_situacao_b = cst_icms.ident_situacao_b
          --   and x7.ident_docto_fiscal = '299250'
             and x7.cod_empresa = estab.cod_empresa
             and x7.cod_estab   = estab.cod_estab
             and x7.situacao      = 'N'
             and estab.cgc      = fil.cnpj
             and x7.cod_class_doc_fis  = '1'
             and x8.vlr_outros1 > 0
             and (x7.movto_e_s   <> '9' or
                 (x7.movto_e_s   = '9' and x7.norm_dev = '2'))
                 --
          union all
                 -- ICMS PARTILHA
           select distinct
                 (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                 to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s || x7.norm_dev ||
                 x7.num_docfis || x7.serie_docfis || x7.sub_serie_docfis ||
                 x4.ind_fis_jur || x4.cod_fis_jur || x7.situacao) ID_NF,
                 fil.id_empresa,
                 fil.id_filial,
                 x7.data_fiscal,
                 x7.ident_docto_fiscal,
                 x8.num_item,
                 'ICMPART' imposto,
                 '1' Ind_tributacao,
                 x8.vlr_contab_item vlr_base,
                 x8.aliq_tributo_icms vlr_aliq,
                 nvl(x8.vlr_trib_icms_orig, 0) + nvl(x8.vlr_trib_icms_dest, 0) + nvl(x8.vlr_fecp_icms, 0) vlr_tributo,
                 cst_icms.cod_situacao_b cst
            from dwt_docto_fiscal   x7,
                 dwt_itens_merc     x8,
                 x2013_produto      prod,
                 x2043_cod_nbm      nbm,
                 y2026_sit_trb_uf_b cst_icms,
                 x04_pessoa_fis_jur x4,
                 x2005_tipo_docto   x2005,
                 estabelecimento   estab,
                 i005_filial       fil
           where 1 = 1
             and x7.ident_docto_fiscal = x8.ident_docto_fiscal
             and x7.ident_fis_jur = x4.ident_fis_jur
             and x7.ident_docto = x2005.ident_docto
             and x8.ident_produto = prod.ident_produto
             and x8.ident_nbm = nbm.ident_nbm
             and x8.ident_situacao_b = cst_icms.ident_situacao_b
          --   and x7.ident_docto_fiscal = '299250'
             and x7.cod_empresa = estab.cod_empresa
             and x7.cod_estab   = estab.cod_estab
             and x7.situacao      = 'N'
             and estab.cgc      = fil.cnpj
             and x7.cod_class_doc_fis  = '1'
             and nvl(x8.vlr_trib_icms_orig, 0) + nvl(x8.vlr_trib_icms_dest, 0) + nvl(x8.vlr_fecp_icms, 0) > 0
             and (x7.movto_e_s   = '9' or
                 (x7.movto_e_s   <> '9' and x7.norm_dev = '2'))
                --
          union all
                -- IPI A RECUPERAR
           select distinct
                 (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                 to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s || x7.norm_dev ||
                 x7.num_docfis || x7.serie_docfis || x7.sub_serie_docfis ||
                 x4.ind_fis_jur || x4.cod_fis_jur || x7.situacao) ID_NF,
                 fil.id_empresa,
                 fil.id_filial,
                 x7.data_fiscal,
                 x7.ident_docto_fiscal,
                 x8.num_item,
                 'IPIREC' imposto,
                 '1' Ind_tributacao,
                 x8.vlr_base_ipi_1 vlr_base,
                 x8.aliq_tributo_ipi vlr_aliq,
                 x8.vlr_tributo_ipi vlr_tributo,
                 x8.cod_trib_ipi cst
            from dwt_docto_fiscal   x7,
                 dwt_itens_merc     x8,
                 x2013_produto      prod,
                 x2043_cod_nbm      nbm,
                 x04_pessoa_fis_jur x4,
                 x2005_tipo_docto   x2005,
                 estabelecimento   estab,
                 i005_filial       fil
           where 1 = 1
             and x7.ident_docto_fiscal = x8.ident_docto_fiscal
             and x7.ident_fis_jur = x4.ident_fis_jur
             and x7.ident_docto = x2005.ident_docto
             and x8.ident_produto = prod.ident_produto
             and x8.ident_nbm = nbm.ident_nbm
             and x7.cod_empresa = estab.cod_empresa
             and x7.cod_estab   = estab.cod_estab
             and x7.situacao      = 'N'
             and estab.cgc      = fil.cnpj
             and x7.cod_class_doc_fis  = '1'
             and x8.vlr_tributo_ipi > 0
             and (x7.movto_e_s   <> '9' or
                 (x7.movto_e_s   = '9' and x7.norm_dev = '2'))
                --
          union all
                -- IPI A RECOLHER
           select distinct
                 (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                 to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s || x7.norm_dev ||
                 x7.num_docfis || x7.serie_docfis || x7.sub_serie_docfis ||
                 x4.ind_fis_jur || x4.cod_fis_jur || x7.situacao) ID_NF,
                 fil.id_empresa,
                 fil.id_filial,
                 x7.data_fiscal,
                 x7.ident_docto_fiscal,
                 x8.num_item,
                 'IPIPAG' imposto,
                 '1' Ind_tributacao,
                 x8.vlr_base_ipi_1 vlr_base,
                 x8.aliq_tributo_ipi vlr_aliq,
                 x8.vlr_tributo_ipi vlr_tributo,
                 x8.cod_trib_ipi cst
            from dwt_docto_fiscal   x7,
                 dwt_itens_merc     x8,
                 x2013_produto      prod,
                 x2043_cod_nbm      nbm,
                 x04_pessoa_fis_jur x4,
                 x2005_tipo_docto   x2005,
                 estabelecimento   estab,
                 i005_filial        fil
           where 1 = 1
             and x7.ident_docto_fiscal = x8.ident_docto_fiscal
             and x7.ident_fis_jur = x4.ident_fis_jur
             and x7.ident_docto = x2005.ident_docto
             and x8.ident_produto = prod.ident_produto
             and x8.ident_nbm = nbm.ident_nbm
             and x7.cod_empresa = estab.cod_empresa
             and x7.cod_estab   = estab.cod_estab
             and x7.situacao      = 'N'
             and estab.cgc      = fil.cnpj
             and x7.cod_class_doc_fis  = '1'
             and x8.vlr_tributo_ipi > 0
             and (x7.movto_e_s   = '9' or
                 (x7.movto_e_s   <> '9' and x7.norm_dev = '2'))
                 --
                 union all
                 -- INSS TERCEIROS
            select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x8.num_item,
                            'INSSTER' imposto,
                            '1' Ind_tributacao,
                            x8.vlr_base_inss vlr_base,
                            x8.vlr_aliq_inss vlr_aliq,
                            x8.vlr_inss_retido vlr_tributo,
                            null cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_merc     x8,
                   x2013_produto      prod,
                   x2043_cod_nbm      nbm,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x8.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x8.ident_produto = prod.ident_produto
               and x8.ident_nbm = nbm.ident_nbm
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis in ('1', '3')
               and x8.vlr_inss_retido > 0
               and x7.movto_e_s <> '9'
            --
            union all
            --
            select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x9.num_item,
                            'INSSTER' imposto,
                            '1' Ind_tributacao,
                            x9.vlr_base_inss vlr_base,
                            x9.vlr_aliq_inss vlr_aliq,
                            x9.vlr_inss_retido vlr_tributo,
                            null cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_serv     x9,
                   x2018_servicos     serv,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x9.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x9.ident_servico = serv.ident_servico
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis in ('2', '3')
               and x9.vlr_inss_retido > 0
               and x7.movto_e_s <> '9'
            --
            union all
            -- INSS PATRONAL
            select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x9.num_item,
                            'INSSPATR' imposto,
                            '1' Ind_tributacao,
                            x7.vlr_base_inss_2 vlr_base,
                            x7.vlr_aliq_inss_2 vlr_aliq,
                            x7.vlr_inss_retido_2 vlr_tributo,
                            null cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_serv     x9,
                   x2018_servicos     serv,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x9.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x9.ident_servico = serv.ident_servico
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis in ('2', '3', '8', '9')
               and x7.vlr_inss_retido_2 > 0
               and x7.movto_e_s <> '9'
               --
               union all
               -- SEST / SENAT
              select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x9.num_item,
                            'SESTSENAT' imposto,
                            '1' Ind_tributacao,
                            x9.vlr_servico vlr_base,
                            0               vlr_aliq,
                            (nvl(x7.vlr_sest, 0) + nvl(x7.vlr_senat, 0)) vlr_tributo,
                            null cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_serv     x9,
                   x2018_servicos     serv,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x9.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x9.ident_servico = serv.ident_servico
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis in ('2', '3', '8', '9')
               and (nvl(x7.vlr_sest, 0) + nvl(x7.vlr_senat, 0)) > 0
               and x7.movto_e_s <> '9'
               --
               union all
               -- INSS FUNRURAL
              select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x8.num_item,
                            'INSSFUNR' imposto,
                            '1' Ind_tributacao,
                            x7.vlr_base_inss vlr_base,
                            x7.vlr_aliq_inss vlr_aliq,
                            x7.vlr_inss_retido vlr_tributo,
                            null cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_merc     x8,
                   x2013_produto      prod,
                   x2043_cod_nbm      nbm,
                   x04_pessoa_fis_jur x4,
                   x2024_modelo_docto x2024,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x8.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x8.ident_produto = prod.ident_produto
               and x8.ident_nbm = nbm.ident_nbm
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and x7.ident_modelo = x2024.ident_modelo
               and x2024.cod_modelo <> '67'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis = '1'
               and x7.vlr_inss_retido > 0
               and x7.movto_e_s <> '9'
             --
               union all
             -- INSS SENAR
               select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x8.num_item,
                            'SENAR' imposto,
                            '1' Ind_tributacao,
                            x7.vlr_base_inss_2 vlr_base,
                            x7.vlr_aliq_inss_2 vlr_aliq,
                            x7.vlr_inss_retido_2 vlr_tributo,
                            null cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_merc     x8,
                   x2013_produto      prod,
                   x2043_cod_nbm      nbm,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x8.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x8.ident_produto = prod.ident_produto
               and x8.ident_nbm = nbm.ident_nbm
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis = '1'
               and x7.vlr_inss_retido_2 > 0
               and x7.movto_e_s <> '9'
               --
               union all
               -- INSS FATURAMENTO
               select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x8.num_item,
                            'INSSFAT' imposto,
                            '1' Ind_tributacao,
                            x7.vlr_tot_nota    vlr_base,
                            0                  vlr_aliq,
                            (nvl(x7.vlr_contrib_prev, 0) + nvl(x7.vlr_contrib_senar, 0) + nvl(x7.vlr_gilrat ,0)) vlr_tributo,
                            null cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_merc     x8,
                   x2013_produto      prod,
                   x2043_cod_nbm      nbm,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x8.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x8.ident_produto = prod.ident_produto
               and x8.ident_nbm = nbm.ident_nbm
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis = '1'
               and (nvl(x7.vlr_contrib_prev, 0) + nvl(x7.vlr_contrib_senar, 0) + nvl(x7.vlr_gilrat ,0))  > 0
               and x7.movto_e_s = '9'
               --
               union all
               -- PIS A RECUPERAR
               select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x8.num_item,
                            'PISREC' imposto,
                            '1' Ind_tributacao,
                            x8.vlr_base_pis    vlr_base,
                            x8.vlr_aliq_pis    vlr_aliq,
                            x8.vlr_pis vlr_tributo,
                            to_char(x8.cod_situacao_pis) cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_merc     x8,
                   x2013_produto      prod,
                   x2043_cod_nbm      nbm,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x8.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x8.ident_produto = prod.ident_produto
               and x8.ident_nbm = nbm.ident_nbm
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis = '1'
               and x8.vlr_pis  > 0
               and x7.movto_e_s <> '9'
               --
               union all
               --
               select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x9.num_item,
                            'PISREC' imposto,
                            '1' Ind_tributacao,
                            x9.vlr_base_pis vlr_base,
                            x9.vlr_aliq_pis vlr_aliq,
                            x9.vlr_pis vlr_tributo,
                            to_char(x9.cod_situacao_pis) cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_serv     x9,
                   x2018_servicos     serv,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x9.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x9.ident_servico = serv.ident_servico
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis = '2'
               and x9.vlr_pis > 0
               and x7.movto_e_s <> '9'
               --
               union all
               -- PIS A RECOLHER
               select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x8.num_item,
                            'PISPAG' imposto,
                            '1' Ind_tributacao,
                            x8.vlr_base_pis    vlr_base,
                            x8.vlr_aliq_pis    vlr_aliq,
                            x8.vlr_pis vlr_tributo,
                            to_char(x8.cod_situacao_pis) cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_merc     x8,
                   x2013_produto      prod,
                   x2043_cod_nbm      nbm,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x8.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x8.ident_produto = prod.ident_produto
               and x8.ident_nbm = nbm.ident_nbm
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis = '1'
               and x8.vlr_pis  > 0
               and x7.movto_e_s = '9'
               --
               union all
               --
               select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x9.num_item,
                            'PISPAG' imposto,
                            '1' Ind_tributacao,
                            x9.vlr_base_pis vlr_base,
                            x9.vlr_aliq_pis vlr_aliq,
                            x9.vlr_pis vlr_tributo,
                            to_char(x9.cod_situacao_pis) cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_serv     x9,
                   x2018_servicos     serv,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x9.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto   = x2005.ident_docto
               and x9.ident_servico = serv.ident_servico
               and x7.cod_empresa   = estab.cod_empresa
               and x7.cod_estab     = estab.cod_estab
               and x7.situacao      = 'N'
               and estab.cgc        = fil.cnpj
               and x7.cod_class_doc_fis = '2'
               and x9.vlr_pis > 0
               and x7.movto_e_s = '9'
               --
               union all
               -- COFINS A RECUPERAR
               select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x8.num_item,
                            'COFREC' imposto,
                            '1' Ind_tributacao,
                            x8.vlr_base_cofins    vlr_base,
                            x8.vlr_aliq_cofins    vlr_aliq,
                            x8.vlr_cofins vlr_tributo,
                            to_char(x8.cod_situacao_cofins) cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_merc     x8,
                   x2013_produto      prod,
                   x2043_cod_nbm      nbm,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x8.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x8.ident_produto = prod.ident_produto
               and x8.ident_nbm = nbm.ident_nbm
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis = '1'
               and x8.vlr_cofins  > 0
               and x7.movto_e_s <> '9'
               --
               union all
               --
               select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x9.num_item,
                            'COFREC' imposto,
                            '1' Ind_tributacao,
                            x9.vlr_base_cofins vlr_base,
                            x9.vlr_aliq_cofins vlr_aliq,
                            x9.vlr_cofins vlr_tributo,
                            to_char(x9.cod_situacao_cofins) cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_serv     x9,
                   x2018_servicos     serv,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x9.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x9.ident_servico = serv.ident_servico
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis = '2'
               and x9.vlr_cofins > 0
               and x7.movto_e_s <> '9'
               --
               union all
               -- COFINS A RECOLHER
               select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x8.num_item,
                            'COFPAG' imposto,
                            '1' Ind_tributacao,
                            x8.vlr_base_cofins    vlr_base,
                            x8.vlr_aliq_cofins    vlr_aliq,
                            x8.vlr_cofins vlr_tributo,
                            to_char(x8.cod_situacao_cofins) cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_merc     x8,
                   x2013_produto      prod,
                   x2043_cod_nbm      nbm,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x8.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x8.ident_produto = prod.ident_produto
               and x8.ident_nbm = nbm.ident_nbm
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis = '1'
               and x8.vlr_cofins  > 0
               and x7.movto_e_s = '9'
               --
               union all
               --
               select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x9.num_item,
                            'COFPAG' imposto,
                            '1' Ind_tributacao,
                            x9.vlr_base_cofins vlr_base,
                            x9.vlr_aliq_cofins vlr_aliq,
                            x9.vlr_cofins vlr_tributo,
                            to_char(x9.cod_situacao_cofins) cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_serv     x9,
                   x2018_servicos     serv,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x9.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x9.ident_servico = serv.ident_servico
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis = '2'
               and x9.vlr_cofins > 0
               and x7.movto_e_s = '9'
               --
               union all
               -- ISS RETIDO
               select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                            to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                            x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                            x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                            x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            x7.data_fiscal,
                            x7.ident_docto_fiscal,
                            x9.num_item,
                            'ISSRET' imposto,
                            '1' Ind_tributacao,
                            x9.vlr_base_iss_retido vlr_base,
                            x9.vlr_aliq_iss_retido vlr_aliq,
                            x9.vlr_iss_retido vlr_tributo,
                            to_char(x9.cod_situacao_cofins) cst
              from dwt_docto_fiscal   x7,
                   dwt_itens_serv     x9,
                   x2018_servicos     serv,
                   x04_pessoa_fis_jur x4,
                   x2005_tipo_docto   x2005,
                   estabelecimento    estab,
                   i005_filial        fil
             where 1 = 1
               and x7.ident_docto_fiscal = x9.ident_docto_fiscal
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.ident_docto = x2005.ident_docto
               and x9.ident_servico = serv.ident_servico
               and x7.cod_empresa = estab.cod_empresa
               and x7.cod_estab = estab.cod_estab
               and x7.situacao = 'N'
               and estab.cgc = fil.cnpj
               and x7.cod_class_doc_fis = '2'
               and x9.vlr_iss_retido > 0
               and x7.movto_e_s = '9';

prompt
prompt Creating view LANCAMENTO_PROC_V
prompt ===============================
prompt
create or replace view interatvi.lancamento_proc_v as
select (lanc.num_lancto || lanc.ind_dc || lanc.cod_conta ||
         to_char(lanc.data_lancto, 'YYYYMMDD') || lanc.id_empresa || imp.id_imposto) id_lancamento,
         lanc.id_empresa,
         lanc.id_filial,
         lanc.num_lancto,
         lanc.ind_dc ind_deb_cred,
         lanc.cod_conta,
         sum(lanc.vlr_lancto) Vlr_Lancto_Residual,
         sum(lanc.vlr_lancto) Vlr_Lancto_Original,
         lanc.data_lancto,
         null justificativa,
         '1' id_class,
         imp.cod_imposto,
         imp.id_imposto
    from i100_lancamentos lanc, i500_param_conta param, i015_imposto imp
   where 1 = 1
     and lanc.id_empresa = param.id_empresa
     and lanc.id_imposto = param.id_imposto
     and lanc.cod_conta = param.cod_conta
     and param.id_imposto = imp.id_imposto
     /*and imp.cod_imposto = 'ICMREC'
     and lanc.id_empresa = '1'
     and lanc.data_lancto between '01/08/2018' and '31/08/2018'*/
   group by lanc.id_empresa,
            lanc.id_filial,
            lanc.num_lancto,
            lanc.ind_dc,
            lanc.cod_conta,
            lanc.data_lancto,
            imp.id_imposto,
            imp.cod_imposto;

prompt
prompt Creating view VW_INSS_TERCEIROS
prompt ===============================
prompt
create or replace view interatvi.vw_inss_terceiros as
select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                x7.situacao) ID_NF,
                fil.id_empresa,
                fil.id_filial,
                x7.data_fiscal,
                x7.ident_docto_fiscal,
                x8.num_item,
                'INSSTERC' Imposto,
                '1' Ind_tributacao,
                x8.vlr_base_inss vlr_base,
                x8.vlr_aliq_inss vlr_aliq,
                x8.vlr_inss_retido vlr_tributo,
                null cst
  from dwt_docto_fiscal   x7,
       dwt_itens_merc     x8,
       x2013_produto      prod,
       x2043_cod_nbm      nbm,
       x04_pessoa_fis_jur x4,
       x2005_tipo_docto   x2005,
       estabelecimento    estab,
       i005_filial        fil
 where 1 = 1
   and x7.ident_docto_fiscal = x8.ident_docto_fiscal
   and x7.ident_fis_jur = x4.ident_fis_jur
   and x7.ident_docto = x2005.ident_docto
   and x8.ident_produto = prod.ident_produto
   and x8.ident_nbm = nbm.ident_nbm
   and x7.cod_empresa = estab.cod_empresa
   and x7.cod_estab = estab.cod_estab
   and x7.situacao = 'N'
   and estab.cgc = fil.cnpj
   /*and fil.idempresa = 1
   and x7.data_fiscal between '01/08/2018' and '31/08/2018'*/
      --             and p_tpImposto  = 5
   and x7.cod_class_doc_fis in ('1', '3')
   and x8.vlr_inss_retido > 0
   and x7.movto_e_s <> '9'
--
union all
--
select distinct (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s ||
                x7.norm_dev || x7.num_docfis || x7.serie_docfis ||
                x7.sub_serie_docfis || x4.ind_fis_jur || x4.cod_fis_jur ||
                x7.situacao) ID_NF,
                fil.id_empresa,
                fil.id_filial,
                x7.data_fiscal,
                x7.ident_docto_fiscal,
                x9.num_item,
                'INSSTERC' Imposto,
                '1' Ind_tributacao,
                x9.vlr_base_inss vlr_base,
                x9.vlr_aliq_inss vlr_aliq,
                x9.vlr_inss_retido vlr_tributo,
                null cst
  from dwt_docto_fiscal   x7,
       dwt_itens_serv     x9,
       x2018_servicos     serv,
       x04_pessoa_fis_jur x4,
       x2005_tipo_docto   x2005,
       estabelecimento    estab,
       i005_filial        fil
 where 1 = 1
   and x7.ident_docto_fiscal = x9.ident_docto_fiscal
   and x7.ident_fis_jur = x4.ident_fis_jur
   and x7.ident_docto = x2005.ident_docto
   and x9.ident_servico = serv.ident_servico
   and x7.cod_empresa = estab.cod_empresa
   and x7.cod_estab = estab.cod_estab
   and x7.situacao = 'N'
   and estab.cgc = fil.cnpj
  /* and fil.idempresa = 1
   and x7.data_fiscal between '01/08/2018' and '31/08/2018'*/
      --             and p_tpImposto  = 5
   and x7.cod_class_doc_fis in ('2', '3')
   and x9.vlr_inss_retido > 0
   and x7.movto_e_s <> '9';

prompt
prompt Creating procedure PRC_ILOG
prompt ===========================
prompt
CREATE OR REPLACE PROCEDURE INTERATVI.PRC_iLOG
                 (P_NUM_PROCESSO  IN  NUMBER,
                  P_MENS_ERRO     IN  VARCHAR2,
                  P_PROCESSO      IN  VARCHAR2,
                  P_MENS_BANCO    IN  VARCHAR2,
                  P_USUARIO       IN NUMBER ) IS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   INSERT INTO i900_processo_log
   (NUM_PROCESSO,MSG_ERRO,PROCESSO,ERRO_DB, ID_USUARIO, DATA_PROCESSO)
   VALUES
   (P_NUM_PROCESSO,P_MENS_ERRO,P_PROCESSO,substr(P_MENS_BANCO, 1, 255), P_USUARIO, sysdate);
   COMMIT;

   RETURN;
EXCEPTION
   WHEN OTHERS THEN
      RAISE_APPLICATION_ERROR(-20000,SUBSTR('Tabela i900_processo_log:'||SQLERRM,1,200));
END;
/

prompt
prompt Creating procedure PRC_LOAD_I802
prompt ================================
prompt
create or replace procedure interatvi.PRC_LOAD_i802(p_id_conciliacao in number,
                                         p_iEmpresa in varchar2,
                                         p_iFilial  in varchar2,
                                         p_iDataIni in date,
                                         p_iDataFim in date,
                                         p_tpImposto in varchar2,
                                         p_processo in varchar2,
                                         p_usuario in varchar2) is


  t_i802     i802_lancto_proc%rowtype := null;

  cursor cLANC is
      select j.id_lancamento
            ,j.id_empresa
            ,j.id_filial
            ,j.num_lancto
            ,j.ind_deb_cred
            ,j.cod_conta
            ,j.Vlr_Lancto_Residual
            ,j.Vlr_Lancto_Original
            ,j.data_lancto
            ,j.justificativa
            ,j.Id_Class
            ,j.id_imposto
      from lancamento_proc_v j,
           i015_imposto     imp
      where 1=1
        and j.id_imposto    = imp.id_imposto
        and imp.cod_imposto = p_tpImposto
        and j.id_empresa    = p_iEmpresa
        and j.data_lancto    between p_iDataIni
                                 and p_iDataFim;

  cursor cZXNF1  is
    select k.ROWID ROWID_ZXNF1
      FROM i802_lancto_proc k,
           i015_imposto imp
     WHERE 1 = 1
       and k.id_imposto    = imp.id_imposto
       and imp.cod_imposto = p_tpImposto
       and k.id_conciliacao = p_id_conciliacao
       and k.id_empresa    = p_iEmpresa
       AND k.data_lancto between p_iDataIni and p_iDataFim;

  TYPE tpTbRowIdZXNF1 IS TABLE OF ROWID INDEX BY BINARY_INTEGER;

  vtpTbRowIdZXNF1 tpTbRowIdZXNF1;


BEGIN

--===================================================================================================
 --- BEGIN - Limpeza

     open cZXNF1;
            --
            loop
              fetch cZXNF1 bulk collect
                into vtpTbRowIdZXNF1 limit 2000;

              if vtpTbRowIdZXNF1.count > 0 then
                --
                forall vnContador in 1 .. vtpTbRowIdZXNF1.count
                --
                  delete from i802_lancto_proc
                   where rowid = vtpTbRowIdZXNF1(vnContador);
                commit; -- commit a cada 2.000 registros
                --
              end if;

              exit when cZXNF1%notfound;
              --
            end loop;
            --
      close cZXNF1;
   -- END - Limpeza
--===================================================================================================

     for mreg in cLANC loop

       t_i802.id_lancamento       := mreg.id_lancamento;
       t_i802.id_empresa          := mreg.id_empresa;
       t_i802.id_filial           := mreg.id_filial;
       t_i802.num_lancto          := mreg.num_lancto;
       t_i802.ind_deb_cred        := mreg.ind_deb_cred;
       t_i802.cod_conta           := mreg.cod_conta;
       t_i802.vlr_lancto_residual := mreg.vlr_lancto_residual;
       t_i802.vlr_lancto_original := mreg.vlr_lancto_original;
       t_i802.data_lancto         := mreg.data_lancto;
       t_i802.justificativa       := mreg.justificativa;
       t_i802.id_imposto          := mreg.id_imposto;
       t_i802.id_class            := mreg.id_class;
       t_i802.id_conciliacao      := p_id_conciliacao;

      begin

        insert into i802_lancto_proc values t_i802;

         exception
           when dup_val_on_index then
                PRC_iLOG(p_processo, 'ID DUPLICADO ' || mreg.id_lancamento, 'PRC_LOAD_i802',  sqlerrm, p_usuario);
    --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
           when others then
              PRC_iLOG(p_processo, 'ERRO NO INSERT', 'PRC_LOAD_i802',  sqlerrm, p_usuario);
         end;

   end loop;

   commit;

end;
/

prompt
prompt Creating procedure PRC_LOAD_I803
prompt ================================
prompt
create or replace procedure interatvi.PRC_LOAD_i803(p_id_conciliacao in number,
                                         p_iEmpresa in varchar2,
                                         p_iFilial  in varchar2,
                                         p_iDataIni in date,
                                         p_iDataFim in date,
                                         p_tpImposto in varchar2,
                                         p_processo in varchar2,
                                         p_usuario in varchar2) is


  t_i803     i803_docto_proc%rowtype := null;

  cursor cDOCTO is
      select j.id_docto
            ,j.id_empresa
            ,j.id_filial
            ,j.num_docto
            ,j.data_docto
            ,j.movto
            ,j.vlr_tributo
            ,j.origem
            ,j.num_lancto
            ,j.cod_conta
            ,j.id_imposto
            ,j.justificativa
            ,j.Id_Class
      from idocto_proc_v    j,
           i015_imposto     imp
      where 1=1
        and j.id_imposto    = imp.id_imposto
        and imp.cod_imposto = p_tpImposto
        and j.id_empresa    = p_iEmpresa
        and j.data_docto    between p_iDataIni
                                and p_iDataFim;

  cursor cZXNF1  is
    select k.ROWID ROWID_ZXNF1
      FROM i803_docto_proc k,
           i015_imposto imp
     WHERE 1 = 1
       and k.id_imposto    = imp.id_imposto
       and imp.cod_imposto = p_tpImposto
       and k.id_conciliacao = p_id_conciliacao
       and k.id_empresa    = p_iEmpresa
       AND k.data_docto between p_iDataIni and p_iDataFim;

  TYPE tpTbRowIdZXNF1 IS TABLE OF ROWID INDEX BY BINARY_INTEGER;

  vtpTbRowIdZXNF1 tpTbRowIdZXNF1;


BEGIN

--===================================================================================================
 --- BEGIN - Limpeza

     open cZXNF1;
            --
            loop
              fetch cZXNF1 bulk collect
                into vtpTbRowIdZXNF1 limit 2000;

              if vtpTbRowIdZXNF1.count > 0 then
                --
                forall vnContador in 1 .. vtpTbRowIdZXNF1.count
                --
                  delete from i803_docto_proc
                   where rowid = vtpTbRowIdZXNF1(vnContador);
                commit; -- commit a cada 2.000 registros
                --
              end if;

              exit when cZXNF1%notfound;
              --
            end loop;
            --
      close cZXNF1;
   -- END - Limpeza
--===================================================================================================

     for mreg in cDOCTO loop

      t_i803.id_documento  := mreg.id_docto;
      t_i803.id_empresa    := mreg.id_empresa;
      t_i803.id_filial     := mreg.id_filial;
      t_i803.num_docto     := mreg.num_docto;
      t_i803.data_docto    := mreg.data_docto;
      t_i803.movto         := mreg.movto;
      t_i803.vlr_lancto    := mreg.vlr_tributo;
      t_i803.origem        := mreg.origem;
      t_i803.num_lancto    := mreg.num_lancto;
      t_i803.cod_conta     := mreg.cod_conta;
      t_i803.id_imposto    := mreg.id_imposto;
      t_i803.justificativa := mreg.justificativa;
      t_i803.id_class      := mreg.id_class;
      t_i803.id_conciliacao := p_id_conciliacao;


      begin

        insert into i803_docto_proc values t_i803;

         exception
           when dup_val_on_index then
                PRC_iLOG(p_processo, 'ID DUPLICADO ' || mreg.id_docto, 'PRC_LOAD_i803',  sqlerrm, p_usuario);
    --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
           when others then
              PRC_iLOG(p_processo, 'ERRO NO INSERT', 'PRC_LOAD_i803',  sqlerrm, p_usuario);
         end;

   end loop;

   commit;

end;
/

prompt
prompt Creating procedure PRC_CONCILIACAO
prompt ==================================
prompt
create or replace procedure interatvi.PRC_CONCILIACAO(p_id_conciliacao in number,
                                            p_processo       in varchar2,
                                            p_usuario        in varchar2) is

  t_i801 i801_conciliacao_det%rowtype := null;

  cursor cLEVEL_ONE(p_conciliacao NUMBER) is
    select distinct conc.id_conciliacao,
                    lanc.id_lancamento,
                    docto.id_documento,
                    lanc.cod_conta,
                    last_day(lanc.data_lancto) periodo,
                    docto.origem,
                    'A' tipo_conc
      from i802_lancto_proc lanc,
           i803_docto_proc  docto,
           i500_param_conta param,
           i800_conciliacao conc
     where 1 = 1
       and lanc.cod_conta = param.cod_conta
       and lanc.id_imposto = param.id_imposto
       and param.id_empresa = lanc.id_empresa
       and lanc.id_empresa = docto.id_empresa
       and lanc.num_lancto = docto.num_lancto
       and (lanc.vlr_lancto_original - docto.vlr_lancto) = 0
       and param.id_imposto = conc.id_imposto
       and lanc.id_empresa = conc.id_empresa
       and last_day(lanc.data_lancto) = last_day(conc.periodo)
       and conc.id_conciliacao = lanc.id_conciliacao
       and lanc.id_conciliacao = docto.id_conciliacao
       and conc.id_conciliacao = p_conciliacao;

  cursor cZXCONC  is
    select k.ROWID ROWID_ZXCONC
      FROM i801_conciliacao_det k
     WHERE 1 = 1
       and k.id_conciliacao = p_id_conciliacao;

  TYPE tpTbRowIdZXCONC IS TABLE OF ROWID INDEX BY BINARY_INTEGER;

  vtpTbRowIdZXCONC tpTbRowIdZXCONC;


BEGIN

--===================================================================================================
 --- BEGIN - Limpeza Conciliação Detalhe

     open cZXCONC;
            --
            loop
              fetch cZXCONC bulk collect
                into vtpTbRowIdZXCONC limit 2000;

              if vtpTbRowIdZXCONC.count > 0 then
                --
                forall vnContador in 1 .. vtpTbRowIdZXCONC.count
                --
                  delete from i801_conciliacao_det
                   where rowid = vtpTbRowIdZXCONC(vnContador);
                commit; -- commit a cada 2.000 registros
                --
              end if;

              exit when cZXCONC%notfound;
              --
            end loop;
            --
      close cZXCONC;
   -- END - Limpeza
--===================================================================================================

--===================================================================================================
 --- BEGIN - Carregar tabelas de processamento

     for reg in (select distinct
                        k.id_conciliacao,
                        k.id_imposto,
                        k.periodo,
                        k.id_empresa,
                        imp.cod_imposto
                  from i800_conciliacao k,
                        i015_imposto imp
                  where k.id_conciliacao = p_id_conciliacao
                     and k.id_imposto = imp.id_imposto) loop

        -- LANCAMENTO PROC
        PRC_LOAD_i802(reg.id_conciliacao,
                      reg.id_empresa,
                      null,
                      trunc(reg.periodo, 'MM'),
                      last_day(reg.periodo),
                      reg.cod_imposto,
                      p_processo,
                      p_usuario);

        -- DOCUMENTO PROC
        PRC_LOAD_i803(reg.id_conciliacao,
                      reg.id_empresa,
                      null,
                      trunc(reg.periodo, 'MM'),
                      last_day(reg.periodo),
                      reg.cod_imposto,
                      p_processo,
                      p_usuario);

     end loop;

    -- END - Carga
  --====================================================================================================
  --- BEGIN - Conciliação nivel 1

  begin

    for mreg in cLEVEL_ONE(p_id_conciliacao) loop

      t_i801.id_conciliacao := mreg.id_conciliacao;
      t_i801.id_lancamento  := mreg.id_lancamento;
      t_i801.id_docto       := mreg.id_documento;
      t_i801.cod_conta      := mreg.cod_conta;
      t_i801.periodo        := mreg.periodo;
      t_i801.origem         := mreg.origem;
      t_i801.ind_conciliado := mreg.tipo_conc;

      begin

        insert into i801_conciliacao_det values t_i801;

            if sql%rowcount > 0 then

                -- limpa tabela Lancto
                begin
                  delete from i802_lancto_proc g
                    where 1=1
                      and g.id_lancamento  = mreg.id_lancamento
                      and g.id_conciliacao = mreg.id_conciliacao;
                exception
                  when others then
                       PRC_iLOG(p_processo,
                                         'Erro na Limpeza da Tabela I802_LANCTO_PROC para o id ' || mreg.id_lancamento || ' - Conciliação: '|| mreg.id_conciliacao ,
                                         'PRC_CONCILIACAO',
                                         sqlerrm,
                                         p_usuario);
                end;


                -- limpa tabela Docto
                begin
                  delete from i803_docto_proc h
                    where 1=1
                      and h.id_documento  = mreg.id_documento
                      and h.id_conciliacao = mreg.id_conciliacao;
                exception
                  when others then
                       PRC_iLOG(p_processo,
                                         'Erro na Limpeza da Tabela I803_DOCTO_PROC para o id ' || mreg.id_documento || ' - Conciliação: '|| mreg.id_conciliacao ,
                                         'PRC_CONCILIACAO',
                                         sqlerrm,
                                         p_usuario);
                end;


            end if;

      exception
        when dup_val_on_index then
          PRC_iLOG(p_processo,
                   'ID DUPLICADO ' || mreg.id_conciliacao,
                   'PRC_CONCILIACAO',
                   sqlerrm,
                   p_usuario);
          --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
        when others then
          PRC_iLOG(p_processo,
                   'ERRO NO INSERT',
                   'PRC_CONCILIACAO',
                   sqlerrm,
                   p_usuario);
      end;

    end loop;

    commit;
  --- END - Conciliação nivel 1
  --===================================================================================================


  end;
end;
/

prompt
prompt Creating procedure PRC_IMP_ICAD
prompt ===============================
prompt
create or replace procedure interatvi.PRC_IMP_iCAD(p_tipo in varchar2, p_processo in varchar2, p_usuario in varchar2) is

BEGIN

    if p_tipo = 'UF' then

        -- UF
        for reg in (select ident_estado, cod_estado, descricao from estado) loop
            begin
              insert into /*+ append */ i011_uf values (reg.ident_estado, reg.cod_estado, reg.descricao);
            exception
              when others then
                PRC_iLOG(p_processo, 'ERRO NO INSERT - ' || p_tipo, 'PRC_IMP_iCAD',  sqlerrm, p_usuario);
            end;
        end loop;
        commit;

    else

        -- MUNICIPIO
        for reg2 in (select rownum id, cod_municipio, descricao, ident_estado from municipio) loop
            begin
              insert into /*+ append */ i012_municipio values (reg2.id, reg2.cod_municipio, reg2.descricao, reg2.ident_estado);
            exception
              when others then
                PRC_iLOG(p_processo, 'ERRO NO INSERT - ' || p_tipo, 'PRC_IMP_iCAD',  sqlerrm, p_usuario);
            end;
        end loop;
        commit;

    end if;

end;
/

prompt
prompt Creating procedure PRC_IMP_I200
prompt ===============================
prompt
create or replace procedure interatvi.PRC_IMP_i200(p_tipo in varchar2,
                                         p_ident_docto in number,
                                         p_id_nf in varchar2,
                                         p_processo in varchar2,
                                         p_usuario in varchar2) is


  t_i200   i200_nota_fiscal%rowtype := null;


  cursor cZXNF is
    select distinct x7.rowid rowid_x7,
                            'MERC'  Tipo,
                            (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                             to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s || x7.norm_dev ||
                             x7.num_docfis || x7.serie_docfis || x7.sub_serie_docfis ||
                             x4.ind_fis_jur || x4.cod_fis_jur || x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            decode(x7.movto_e_s, '9', '0', '1') ind_oper,
                            decode(x7.movto_e_s, '9', '1', '0') ind_emissao,
                            x7.movto_e_s,
                            x7.cod_class_doc_fis,
                            x7.data_emissao,
                            x7.data_fiscal,
                            x7.num_docfis,
                            x7.serie_docfis,
                            x7.norm_dev,
                            x7.num_autentic_nfe,
                            x2005.cod_docto,
                            x2005.descricao,
                            x2024.cod_modelo,
                            x7.situacao,
                            x7.cod_sistema_orig IND_NF_MANUAL,
                            x7.vlr_tot_nota,
                            x7.vlr_produto,
                            x7.num_lancamento,
                            x7.num_controle_docto,
                            x4.cod_fis_jur,
                            x4.cpf_cgc,
                            x4.razao_social,
                            x4.insc_estadual,
                            x7.ident_docto,
                            x7.ident_fis_jur,
                            x7.cod_empresa,
                            x7.cod_estab,
                            x7.ident_docto_fiscal,
                            x7.num_selo_cont_icms miro
              from dwt_docto_fiscal   x7,
                   dwt_itens_merc     x8,
                   estabelecimento    estab,
                   i005_filial        fil,
                   x2005_tipo_docto   x2005,
                   x2024_modelo_docto x2024,
                   x04_pessoa_fis_jur x4
             where 1 = 1
               and x7.ident_docto_fiscal = x8.ident_docto_fiscal
               and x7.cod_empresa   = estab.cod_empresa
               and x7.cod_estab     = estab.cod_estab
               and estab.cgc        = fil.cnpj
               and x7.ident_docto   = x2005.ident_docto
               and x7.ident_modelo  = x2024.ident_modelo(+)
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.situacao      = 'N'
                  --  and x7.num_docfis = '000005053'
               and x8.ident_docto_fiscal   = p_ident_docto
               and p_tipo           = 'MERC'
           --
           union all
           --
            select distinct x7.rowid rowid_x7,
                            'SERV'  Tipo,
                            (x2005.cod_docto || x7.cod_empresa || x7.cod_estab ||
                             to_char(x7.data_fiscal, 'YYYYMMDD') || x7.movto_e_s || x7.norm_dev ||
                             x7.num_docfis || x7.serie_docfis || x7.sub_serie_docfis ||
                             x4.ind_fis_jur || x4.cod_fis_jur || x7.situacao) ID_NF,
                            fil.id_empresa,
                            fil.id_filial,
                            decode(x7.movto_e_s, '9', '0', '1') ind_oper,
                            decode(x7.movto_e_s, '9', '1', '0') ind_emissao,
                            x7.movto_e_s,
                            x7.cod_class_doc_fis,
                            x7.data_emissao,
                            x7.data_fiscal,
                            x7.num_docfis,
                            x7.serie_docfis,
                            x7.norm_dev,
                            x7.num_autentic_nfe,
                            x2005.cod_docto,
                            x2005.descricao,
                            x2024.cod_modelo,
                            x7.situacao,
                            x7.cod_sistema_orig IND_NF_MANUAL,
                            x7.vlr_tot_nota,
                            x7.vlr_produto,
                            x7.num_lancamento,
                            x7.num_controle_docto,
                            x4.cod_fis_jur,
                            x4.cpf_cgc,
                            x4.razao_social,
                            x4.insc_estadual,
                            x7.ident_docto,
                            x7.ident_fis_jur,
                            x7.cod_empresa,
                            x7.cod_estab,
                            x7.ident_docto_fiscal,
                            x7.num_selo_cont_icms miro
              from dwt_docto_fiscal   x7,
                   dwt_itens_serv     x9,
                   estabelecimento    estab,
                   i005_filial             fil,
                   x2005_tipo_docto   x2005,
                   x2024_modelo_docto x2024,
                   x04_pessoa_fis_jur x4
             where 1 = 1
               and x7.ident_docto_fiscal = x9.ident_docto_fiscal
               and x7.cod_empresa   = estab.cod_empresa
               and x7.cod_estab     = estab.cod_estab
               and estab.cgc        = fil.cnpj
               and x7.ident_docto   = x2005.ident_docto
               and x7.ident_modelo  = x2024.ident_modelo(+)
               and x7.ident_fis_jur = x4.ident_fis_jur
               and x7.situacao      = 'N'
                  --  and x7.num_docfis = '000005053'
               and x9.ident_docto_fiscal   = p_ident_docto
               and p_tipo           = 'SERV';


BEGIN


     for mreg in cZXNF loop


            t_i200.id_nf        :=  mreg.id_nf;
            t_i200.id_empresa   :=  mreg.id_empresa;
            t_i200.id_filial    :=  mreg.id_filial;
            t_i200.ind_oper     :=  mreg.ind_oper;
            t_i200.ind_emissao  :=  mreg.ind_emissao;
            t_i200.ind_tipo_nf  :=  mreg.cod_class_doc_fis;
            t_i200.data_emissao :=  mreg.data_emissao;
            t_i200.data_e_s     :=  mreg.data_fiscal;
            t_i200.num_nf       :=  mreg.num_docfis;
            t_i200.serie        :=  mreg.serie_docfis;
            t_i200.norm_dev     :=  mreg.norm_dev;
            t_i200.chave_nfe    :=  mreg.num_autentic_nfe;
            t_i200.tp_docto      :=  mreg.cod_docto;
            t_i200.desc_tp_docto :=  mreg.descricao;
            t_i200.modelo_nf     :=  mreg.cod_modelo;
            t_i200.ind_situacao :=  mreg.situacao;
            t_i200.ind_nf_manual  := mreg.ind_nf_manual;
            t_i200.vlr_nf         :=  mreg.vlr_tot_nota;
            t_i200.vlr_merc_serv  := mreg.vlr_produto;
            t_i200.num_lancto     := mreg.num_lancamento;
            t_i200.docnum        := mreg.num_controle_docto;
            t_i200.cod_parceiro   := mreg.cod_fis_jur;
            t_i200.cnpj_parceiro  := mreg.cpf_cgc;
            t_i200.razao_social   := mreg.razao_social;
            t_i200.inscr_estadual := mreg.insc_estadual;
            t_i200.aux01          := null;
            t_i200.aux02          := null;
            t_i200.aux03          := mreg.miro;
            t_i200.aux04          := null;
            t_i200.aux05          := null;
            t_i200.aux06          := null;
            t_i200.ind_integracao := 'B';


      begin

        insert into /*+ append */  i200_nota_fiscal values t_i200;

         exception
           when dup_val_on_index then
                PRC_iLOG(p_processo, 'ID DUPLICADO ' || p_ident_docto, 'PRC_IMP_i200',  sqlerrm, p_usuario);
    --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
           when others then
              PRC_iLOG(p_processo, 'ERRO NO INSERT - ' || p_ident_docto, 'PRC_IMP_i200',  sqlerrm, p_usuario);
         end;

          /*if sql%rowcount > 0 then
             PRC_IMP_i201(mreg.tipo, mreg.ident_docto_fiscal, mreg.id_nf, p_processo, p_processo);
         end if;*/

   end loop;

   commit;
exception
  when others then
    PRC_iLOG(p_processo, 'ERRO GERAL', 'PRC_IMP_i200',  sqlerrm, p_usuario);
end;
/

prompt
prompt Creating procedure PRC_IMP_I201
prompt ===============================
prompt
create or replace procedure interatvi.PRC_IMP_i201(p_tipo in varchar2,
                                         p_ident_docto in number,
                                         p_id_nf in varchar2,
                                         p_processo in varchar2,
                                         p_usuario in varchar2) is


  t_i201    i201_nf_item%rowtype := null;


  cursor cZX_LINE_NF is
            select distinct  prod.cod_produto cod_item
                            ,prod.descricao desc_item
                            ,nbm.cod_nbm
                            ,nbm.descricao desc_nbm
                            ,x8.num_item
                            ,cfo.cod_cfo
                            ,cfo.descricao desc_cfop
                            ,nop.cod_natureza_op
                            ,nop.descricao desc_nop
                            ,med.cod_medida
                            ,dwt8.vlr_item
                            ,dwt8.vlr_contab_item
                            ,x8.dsc_reservado1 num_pedido
                            ,null   cod_serv_lei_116
                      from dwt_itens_merc          dwt8,
                           x08_itens_merc     x8,
                           x2043_cod_nbm      nbm,
                           x2012_cod_fiscal   cfo,
                           x2006_natureza_op  nop,
                           x2013_produto      prod,
                           x2007_medida       med
                     where 1 = 1
                       and dwt8.cod_empresa   = x8.cod_empresa
                       and dwt8.cod_estab     = x8.cod_estab
                       and dwt8.movto_e_s     = x8.movto_e_s
                       and dwt8.data_fiscal   = x8.data_fiscal
                       and dwt8.norm_dev      = x8.norm_dev
                       and dwt8.ident_docto   = x8.ident_docto
                       and dwt8.ident_fis_jur = x8.ident_fis_jur
                       and dwt8.num_docfis    = x8.num_docfis
                       and dwt8.serie_docfis  = x8.serie_docfis
                       and dwt8.num_item      = x8.num_item
                       and dwt8.ident_nbm     = nbm.ident_nbm(+)
                       and dwt8.ident_cfo     = cfo.ident_cfo
                       and dwt8.ident_natureza_op = nop.ident_natureza_op(+)
                       and dwt8.ident_produto = prod.ident_produto
                       and dwt8.ident_medida  = med.ident_medida
                       and dwt8.ident_docto_fiscal   = p_ident_docto
                       and p_tipo           = 'MERC'
                 --
               union all
                --
                select distinct serv.cod_servico cod_item
                                ,serv.descricao desc_item
                                ,null cod_nbm
                                ,null desc_nbm
                                ,dwt9.num_item
                                ,cfo.cod_cfo
                                ,cfo.descricao desc_cfop
                                ,nop.cod_natureza_op
                                ,nop.descricao desc_nop
                                ,null cod_medida
                                ,x9.vlr_servico vlr_item
                                ,x9.vlr_tot vlr_contab_item
                                ,x9.dsc_reservado1 num_pedido
                                ,lei_116.cod_serv_lei_116
                          from dwt_itens_serv         dwt9,
                               x09_itens_serv     x9,
          --                     msaf.x2043_cod_nbm      nbm,
                               x2012_cod_fiscal   cfo,
                               x2006_natureza_op  nop,
                               x2018_servicos     serv,
                               dwt_servico_lei_116     lei_116
                         where 1 = 1
                           and dwt9.cod_empresa   = x9.cod_empresa
                           and dwt9.cod_estab     = x9.cod_estab
                           and dwt9.movto_e_s     = x9.movto_e_s
                           and dwt9.data_fiscal   = x9.data_fiscal
                           and dwt9.norm_dev      = x9.norm_dev
                           and dwt9.ident_docto   = x9.ident_docto
                           and dwt9.ident_fis_jur = x9.ident_fis_jur
                           and dwt9.num_docfis    = x9.num_docfis
                           and dwt9.serie_docfis  = x9.serie_docfis
                           and dwt9.num_item      = x9.num_item
                           and dwt9.ident_natureza_op = nop.ident_natureza_op(+)
                           and dwt9.ident_servico = serv.ident_servico
                           and serv.ident_serv_lei_116 = lei_116.ident_serv_lei_116
                           and dwt9.ident_docto_fiscal   = p_ident_docto
                           and p_tipo           = 'SERV'
                    ;


BEGIN


     for mreg in cZX_LINE_NF loop


          t_i201.id_nf       :=  p_id_nf;
          t_i201.cod_item    :=  mreg.cod_item;
          t_i201.descricao_item  :=  mreg.desc_item;
          t_i201.cod_ncm     :=  mreg.cod_nbm;
          t_i201.descr_ncm  :=  mreg.desc_nbm;
          t_i201.num_item    :=  mreg.num_item;
          t_i201.cfop        :=  mreg.cod_cfo;
          t_i201.descr_cfop  :=  mreg.desc_cfop;
          t_i201.nat_op       :=  mreg.cod_natureza_op;
          t_i201.descr_nat_op :=  mreg.desc_nop;
          t_i201.cod_medida  :=  mreg.cod_medida;
          t_i201.vlr_item    :=  mreg.vlr_item;
          t_i201.vlr_contabil_item := mreg.vlr_contab_item;
          t_i201.num_pedido  := mreg.num_pedido;
          t_i201.cod_lei_116 := mreg.cod_serv_lei_116;


      begin

         insert into /*+ append */  i201_nf_item values t_i201;

         exception
           when dup_val_on_index then
                PRC_iLOG(p_processo, 'ID DUPLICADO ' || p_ident_docto, 'PRC_IMP_i201',  sqlerrm, p_usuario);
    --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
           when others then
              PRC_iLOG(p_processo, 'ERRO NO INSERT - ' || p_ident_docto, 'PRC_IMP_i201',  sqlerrm, p_usuario);
         end;

   end loop;

   commit;
exception
  when others then
    PRC_iLOG(p_processo, 'ERRO', 'PRC_IMP_i201',  sqlerrm, p_usuario);
end;
/

prompt
prompt Creating procedure PRC_IMP_INF
prompt ==============================
prompt
create or replace procedure interatvi.PRC_IMP_iNF(p_iEmpresa in varchar2,
                                         p_iFilial  in varchar2,
                                         p_iDataIni in date,
                                         p_iDataFim in date,
                                         p_tpImposto in varchar2,
                                         p_processo in varchar2,
                                         p_usuario in varchar2) is


   t_i202       i202_item_imposto%rowtype := null;


  cursor cZX_IMP_LINES is
          select j.id_nf,
                 j.id_empresa,
                 j.id_filial,
                 j.data_fiscal,
                 j.ident_docto_fiscal,
                 j.num_item,
                 j.imposto,
                 imp.id_imposto,
                 j.ind_tributacao,
                 j.vlr_base,
                 j.vlr_aliq,
                 j.vlr_tributo,
                 j.cst
          from impostos_nf_v j,
               i015_imposto imp
          where 1=1
            and j.imposto = imp.cod_imposto
            and j.id_empresa = p_iEmpresa
            and j.data_fiscal between p_iDataIni
                                  and p_iDataFim
            and imp.cod_imposto = p_tpImposto
            ;


  cursor cZXNF  is
    select g.ROWID ROWID_ZXNF
      FROM i200_nota_fiscal k,
           i202_item_imposto g,
           i015_imposto      imp
     WHERE 1 = 1
       and k.id_nf = g.id_nf
       and k.id_empresa = p_iEmpresa
       AND g.id_imposto = imp.id_imposto
       and imp.cod_imposto = p_tpImposto
       AND k.data_e_s between p_iDataIni and p_iDataFim;

  TYPE tpTbRowIdZXNF IS TABLE OF ROWID INDEX BY BINARY_INTEGER;

  vtpTbRowIdZXNF tpTbRowIdZXNF;

BEGIN

--===================================================================================================
 --- BEGIN - Limpeza

     open cZXNF;
            --
            loop
              fetch cZXNF bulk collect
                into vtpTbRowIdZXNF limit 2000;

              if vtpTbRowIdZXNF.count > 0 then
                --
                forall vnContador in 1 .. vtpTbRowIdZXNF.count
                --
                  delete from i202_item_imposto
                   where rowid = vtpTbRowIdZXNF(vnContador);
                commit; -- commit a cada 2.000 registros
                --
              end if;

              exit when cZXNF%notfound;
              --
            end loop;
            --
      close cZXNF;
   -- END - Limpeza
--===================================================================================================

     for mreg in cZX_IMP_LINES loop


        t_i202.id_nf          := mreg.id_nf;
        t_i202.num_item       := mreg.num_item;
        t_i202.id_imposto     := mreg.id_imposto;
        t_i202.ind_tributacao := mreg.Ind_tributacao;
        t_i202.vlr_base       := mreg.vlr_base;
        t_i202.vlr_aliq       := mreg.vlr_aliq;
        t_i202.vlr_tributo    := mreg.vlr_tributo;
        t_i202.cst            := mreg.cst;

      begin

         insert into /*+ append */  i202_item_imposto values t_i202;

         exception
           when dup_val_on_index then
                PRC_iLOG(p_processo, 'ID DUPLICADO ' || mreg.ident_docto_fiscal, 'PRC_IMP_iNF',  sqlerrm, p_usuario);
    --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
           when others then
              if sqlcode = '-2291' then
                 -- nota fiscal
                 PRC_IMP_i200('MERC', mreg.ident_docto_fiscal, mreg.id_nf, p_processo, p_usuario);

                 -- item nota fiscal
                 PRC_IMP_i201('MERC', mreg.ident_docto_fiscal, mreg.id_nf, p_processo, p_usuario);

                 begin
                   insert into /*+ append */  i202_item_imposto values t_i202;
                 exception
                   when others then
                      PRC_iLOG(p_processo, 'ERRO NO INSERT ' || mreg.ident_docto_fiscal, 'PRC_IMP_iNF',  sqlerrm, p_usuario);
                 end;

              else
                PRC_iLOG(p_processo, 'ERRO NO INSERT ' || mreg.ident_docto_fiscal, 'PRC_IMP_iNF',  sqlerrm, p_usuario);
              end if;
         end;

   end loop;

   commit;
exception
  when others then
    PRC_iLOG(p_processo, 'ERRO GERAL', 'PRC_IMP_iNF',  sqlerrm, p_usuario);
end;
/

prompt
prompt Creating procedure PRC_IMP_I005
prompt ===============================
prompt
create or replace procedure interatvi.PRC_IMP_i005(p_empresa in varchar2, p_processo in varchar2, p_usuario in varchar2) is

BEGIN

     --    execute immediate 'truncate table i005_filial';

          insert into /*+ append */  i005_filial value (
                      select c.id_empresa,
                             rownum,
                             a.cod_estab,
                             substr(a.razao_social, 1, 60),
                             a.ind_matriz_filial,
                             a.cgc,
                             b.nire,
                             a.cod_atividade,
                             b.inscricao_estadual,
                             a.endereco,
                             a.num_endereco,
                             a.compl_endereco,
                             a.bairro,
                             d.id_uf,
                             a.cep,
                             a.dat_ini_atividade,
                             'S',
                             e.id_municipio
                        from estabelecimento   a,
                             registro_estadual b,
                             i002_empresa      c,
                             i011_uf           d,
                             i012_municipio    e
                       where 1 = 1
                         and a.cod_empresa = b.cod_empresa
                         and a.cod_estab = b.cod_estab
                         and a.cod_empresa = c.cod_empresa
                         and a.ident_estado = b.ident_estado
                         and c.id_empresa  = p_empresa
                         and a.ident_estado = d.id_uf
                         and d.id_uf        = e.id_uf
                         and a.cod_municipio = e.cod_municipio
                           );
             commit;

end;
/

prompt
prompt Creating procedure PRC_IMP_I013
prompt ===============================
prompt
create or replace procedure interatvi.PRC_IMP_i013(p_iEmpresa in number,
                                         p_processo in number,
                                         p_usuario in number) is

BEGIN

  for mreg in (select distinct e.id_empresa,
                                a.cod_conta,
                                a.ind_conta,
                                a.descricao,
                                a.nivel,
                                c.cod_conta conta_sintetica
                  from x2002_plano_contas a,
                       grupo_estab        b,
                       x2002_plano_contas c,
                       empresa            d,
                       i002_empresa            e,
                       relac_tab_grupo    f
                 where 1 = 1
                   and a.ind_conta = 'A'
                   and a.grupo_conta = f.grupo_estab
                   and f.cod_tabela  = '2002'
                   and f.cod_empresa = d.cod_empresa
                   and e.id_empresa  = p_iEmpresa
                   and d.cnpj = e.cnpj
                   and a.ident_conta_sint = c.ident_conta
                   /*and a.valid_conta = (select max(b.valid_conta)
                                          from x2002_plano_contas b
                                         where b.cod_conta = a.cod_conta)*/) loop

    begin
      insert into /*+ append */ i013_plano_contas values
              (mreg.id_empresa,
               mreg.cod_conta,
               mreg.ind_conta,
               mreg.descricao,
               mreg.nivel,
               mreg.conta_sintetica);
     exception
       when dup_val_on_index then
         begin
           update i013_plano_contas h set h.ind_conta = mreg.ind_conta,
                                          h.descricao_conta = mreg.descricao,
                                          h.nivel = mreg.nivel,
                                          h.cod_conta_sintetica = mreg.conta_sintetica
           where h.cod_conta = mreg.cod_conta
             and h.id_empresa = mreg.id_empresa;
         end;
       when others then
         PRC_iLOG(p_processo, 'ERRO NO INSERT', 'PRC_IMP_i013',  sqlerrm, p_usuario);
       end;

    end loop;
    commit;

  end;
/

prompt
prompt Creating procedure PRC_IMP_I100
prompt ===============================
prompt
create or replace procedure interatvi.PRC_IMP_i100(p_iEmpresa in varchar2,
                                         p_iFilial  in varchar2,
                                         p_iDataIni in date,
                                         p_iDataFim in date,
                                         p_tpImposto in varchar2,
                                         p_processo in varchar2,
                                         p_usuario in varchar2) is


  v_id_lancto  i100_lancamentos.id_lancamento%type := null;

  cursor cZXLANC is
          select x1.num_lancamento,
                 x1.cod_empresa,
                 x1.cod_estab,
                 fil.id_filial,
                 fil.id_empresa,
                 x2002.cod_conta,
                 x1.data_lancto,
                 x1.arquivamento,
                 x1.vlr_lancto,
                 x1.ind_deb_cre,
                 x1.tipo_lancto,
                 null              docnum,
                 null              num_nf,
                 null              cod_parceiro,
                 null              cnpj_parceiro,
                 null              num_pedido,
                 param.id_imposto
            from x01_contabil       x1,
                 x2002_plano_contas x2002,
                 estabelecimento    estab,
                 i005_filial        fil,
                 i500_param_conta   param,
                 i015_imposto       imp
           where 1 = 1
             and x1.cod_empresa = estab.cod_empresa
             and x1.cod_estab = estab.cod_estab
             and estab.cgc = fil.cnpj
             and x1.ident_conta = x2002.ident_Conta
             and x2002.cod_conta  = param.cod_conta
             and param.id_imposto = imp.id_imposto
             and imp.cod_imposto  = p_tpImposto
             and param.id_empresa = fil.id_empresa
             and fil.id_empresa    = p_iEmpresa
        --     and fil.cnpj         = p_iFilial -- '13837846000122'
             and x1.data_lancto   between p_iDataIni --'01/01/2014'
                                     and p_iDataFim;

  cursor cZXLANC1  is
    select k.ROWID ROWID_ZXLANC1
      FROM i100_lancamentos k,
           i015_imposto     imp
     WHERE 1 = 1
       and k.id_empresa    = p_iEmpresa
       AND k.id_imposto    = imp.id_imposto
       and imp.cod_imposto = p_tpImposto
       AND k.data_lancto between p_iDataIni and p_iDataFim;

  TYPE tpTbRowIdZXLANC1 IS TABLE OF ROWID INDEX BY BINARY_INTEGER;

  vtpTbRowIdZXLANC1 tpTbRowIdZXLANC1;


BEGIN

--===================================================================================================
 --- BEGIN - Limpeza

     open cZXLANC1;
            --
            loop
              fetch cZXLANC1 bulk collect
                into vtpTbRowIdZXLANC1 limit 2000;

              if vtpTbRowIdZXLANC1.count > 0 then
                --
                forall vnContador in 1 .. vtpTbRowIdZXLANC1.count
                --
                  delete from i100_lancamentos
                   where rowid = vtpTbRowIdZXLANC1(vnContador);
                commit; -- commit a cada 2.000 registros
                --
              end if;

              exit when cZXLANC1%notfound;
              --
            end loop;
            --
      close cZXLANC1;
   -- END - Limpeza
--===================================================================================================

     for mreg in cZXLANC loop

      begin

      insert into /*+ append */  i100_lancamentos values
           (
               mreg.cod_empresa || mreg.cod_estab || to_char(mreg.data_lancto, 'YYYYMMDD') || mreg.arquivamento,
               mreg.num_lancamento,
               mreg.id_empresa,
               mreg.id_filial,
               mreg.cod_conta,
               mreg.data_lancto,
               mreg.arquivamento,
               mreg.vlr_lancto,
               mreg.ind_deb_cre,
               'N', -- ind_lancto
               mreg.tipo_lancto,
               mreg.num_lancamento, -- lancamento compensacao
               mreg.docnum,
               mreg.num_nf,
               mreg.cod_parceiro,
               mreg.cnpj_parceiro,
               mreg.num_pedido,
               null, -- aux02
               null, -- aux03
               null, -- aux04
               null, -- aux05
               null, -- aux06
               'A',
               mreg.id_imposto
             );
         exception
           when dup_val_on_index then
                PRC_iLOG(p_processo, 'ID DUPLICADO ' || mreg.arquivamento, 'PRC_IMP_i100',  sqlerrm, p_usuario);
    --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
           when others then
              PRC_iLOG(p_processo, 'ERRO NO INSERT', 'PRC_IMP_i100',  sqlerrm, p_usuario);
         end;

   end loop;

   commit;

end;
/

prompt
prompt Creating procedure PRC_IMP_I101
prompt ===============================
prompt
create or replace procedure interatvi.PRC_IMP_i101(p_iEmpresa in varchar2,
                                         p_iFilial  in varchar2,
                                         p_iDataIni in date,
                                         p_iDataFim in date,
                                         p_tpImposto in varchar2,
                                         p_processo in varchar2,
                                         p_usuario in varchar2) is


  t_i101            i101_saldos%rowtype := null;

  cursor cZSALDO is
        select  (x2.cod_empresa || x2.cod_estab || to_char(x2.data_saldo, 'YYYYMMDD') || x2002.cod_conta) id_saldo,
                 x2.cod_empresa,
                 x2.cod_estab,
                 fil.id_filial,
                 fil.id_empresa,
                 x2002.cod_conta,
                 x2.data_saldo,
                 x2.vlr_saldo_ini,
                 x2.ind_saldo_ini,
                 x2.vlr_saldo_fim,
                 x2.ind_saldo_fim,
                 x2.vlr_tot_cre,
                 x2.vlr_tot_deb,
                 param.id_imposto
            from x02_saldos       x2,
                 x2002_plano_contas x2002,
                 estabelecimento    estab,
                 i005_filial        fil,
                 i500_param_conta   param
           where 1 = 1
             and x2.cod_empresa = estab.cod_empresa
             and x2.cod_estab = estab.cod_estab
             and estab.cgc = fil.cnpj
             and x2.ident_conta = x2002.ident_Conta
             and x2002.cod_conta  = param.cod_conta
             and param.id_imposto = p_tpImposto
             and param.id_empresa = fil.id_empresa
             and fil.id_empresa    = p_iEmpresa
        --     and fil.cnpj         = p_iFilial -- '13837846000122'
             and x2.data_saldo   between p_iDataIni --'01/01/2014'
                                     and p_iDataFim;

  cursor cZSALDO1  is
    select k.ROWID ROWID_ZSALDO
      FROM i101_saldos k,
           i500_param_conta l
      where 1=1
       and k.id_empresa = p_iEmpresa
       and k.id_empresa = l.id_empresa
       and k.cod_conta  = l.cod_conta
       AND l.id_imposto = p_tpImposto
       AND k.periodo between p_iDataIni and p_iDataFim;

  TYPE tpTbRowIdZSALDO1 IS TABLE OF ROWID INDEX BY BINARY_INTEGER;

  vtpTbRowIdZXSALDO1 tpTbRowIdZSALDO1;


BEGIN

--===================================================================================================
 --- BEGIN - Limpeza

     open cZSALDO1;
            --
            loop
              fetch cZSALDO1 bulk collect
                into vtpTbRowIdZXSALDO1 limit 2000;

              if vtpTbRowIdZXSALDO1.count > 0 then
                --
                forall vnContador in 1 .. vtpTbRowIdZXSALDO1.count
                --
                  delete from i101_saldos
                   where rowid = vtpTbRowIdZXSALDO1(vnContador);
                commit; -- commit a cada 2.000 registros
                --
              end if;

              exit when cZSALDO1%notfound;
              --
            end loop;
            --
      close cZSALDO1;
   -- END - Limpeza
--===================================================================================================

     for mreg in cZSALDO loop

      t_i101.id_saldo      := mreg.id_saldo;
      t_i101.id_empresa    := mreg.id_empresa;
      t_i101.id_filial     := mreg.id_filial;
      t_i101.periodo       := mreg.data_saldo;
      t_i101.cod_conta     := mreg.cod_conta;
      t_i101.vlr_saldo_ini := mreg.vlr_saldo_ini;
      t_i101.ind_deb_cred_ini := mreg.ind_saldo_ini;
      t_i101.vlr_saldo_fim := mreg.vlr_saldo_fim;
      t_i101.ind_deb_cred_fim := mreg.ind_saldo_fim;
      t_i101.vlr_tot_cred  := mreg.vlr_tot_cre;
      t_i101.vlr_tot_deb   := mreg.vlr_tot_deb;
      t_i101.ind_contab_fiscal := 'C';
      t_i101.ind_integracao := 'B';

      begin

      insert into /*+ append */  i101_saldos values t_i101;

         exception
           when dup_val_on_index then
                PRC_iLOG(p_processo, 'ID DUPLICADO ' || mreg.id_saldo, 'PRC_IMP_i101',  sqlerrm, p_usuario);
    --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
           when others then
              PRC_iLOG(p_processo, 'ERRO NO INSERT', 'PRC_IMP_i101',  sqlerrm, p_usuario);
         end;

   end loop;

   commit;

end;
/

prompt
prompt Creating procedure PRC_IMP_I203
prompt ===============================
prompt
create or replace procedure interatvi.PRC_IMP_i203(p_iEmpresa in varchar2,
                                         p_iFilial  in varchar2,
                                         p_iDataIni in date,
                                         p_iDataFim in date,
                                         p_tpImposto in varchar2,
                                         p_processo in varchar2,
                                         p_usuario in varchar2) is


  t_i203     i203_ativo%rowtype := null;

  cursor cZXNF is
      select j.id_ativo,
             j.cod_empresa,
             j.cod_estab,
             j.id_empresa,
             j.id_filial,
             imp.id_imposto,
             j.ind_oper_cred,
             j.cod_bem,
             j.cod_inc_bem,
             j.data_lancto,
             j.ind_origem_cred_bem,
             j.vlr_bem_ativo_imob,
             j.cst,
             j.vlr_base,
             j.vlr_aliq,
             j.vlr_tributo,
             j.vlr_parcela_dep_mes
        from efd_ativo_v j,
             i015_imposto imp
      where 1=1
        and j.imposto       = imp.cod_imposto
        and imp.cod_imposto = p_tpImposto
        and j.id_empresa     = p_iEmpresa
        and j.data_lancto   between p_iDataIni
                                and p_iDataFim;


  cursor cZXNF1  is
    select k.ROWID ROWID_ZXNF1
      FROM i203_ativo k,
           i015_imposto imp
     WHERE 1 = 1
       and k.id_imposto    = imp.id_imposto
       and imp.cod_imposto = p_tpImposto
       and k.id_empresa = p_iEmpresa
       AND k.data_parcela between p_iDataIni and p_iDataFim;

  TYPE tpTbRowIdZXNF1 IS TABLE OF ROWID INDEX BY BINARY_INTEGER;

  vtpTbRowIdZXNF1 tpTbRowIdZXNF1;


BEGIN

--===================================================================================================
 --- BEGIN - Limpeza

     open cZXNF1;
            --
            loop
              fetch cZXNF1 bulk collect
                into vtpTbRowIdZXNF1 limit 2000;

              if vtpTbRowIdZXNF1.count > 0 then
                --
                forall vnContador in 1 .. vtpTbRowIdZXNF1.count
                --
                  delete from i203_ativo
                   where rowid = vtpTbRowIdZXNF1(vnContador);
                commit; -- commit a cada 2.000 registros
                --
              end if;

              exit when cZXNF1%notfound;
              --
            end loop;
            --
      close cZXNF1;
   -- END - Limpeza
--===================================================================================================

     for mreg in cZXNF loop

      t_i203.id_docto_ativo   := mreg.id_ativo;
      t_i203.tipo_docto       := 'ATIVO';
      t_i203.data_parcela     := mreg.data_lancto;
      t_i203.num_parcela      := '1';
      t_i203.id_empresa       := mreg.id_empresa;
      t_i203.id_filial        := mreg.id_filial;
      t_i203.id_imposto       := mreg.id_imposto;
      t_i203.num_lancto       := null;
      t_i203.vlr_operacao     := mreg.vlr_parcela_dep_mes;
      t_i203.cst              := mreg.cst;
      t_i203.vlr_base         := mreg.vlr_base;
      t_i203.vlr_aliquota     := mreg.vlr_aliq;
      t_i203.vlr_tributo      := mreg.vlr_tributo;


      begin

        insert into /*+ append */  i203_ativo values t_i203;

       exception
           when dup_val_on_index then
                PRC_iLOG(p_processo, 'ID DUPLICADO ' || mreg.id_ativo, 'PRC_IMP_i203',  sqlerrm, p_usuario);
    --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
           when others then
              PRC_iLOG(p_processo, 'ERRO NO INSERT', 'PRC_IMP_i203',  sqlerrm, p_usuario);
       end;

   end loop;

   commit;

end;
/

prompt
prompt Creating procedure PRC_IMP_I204
prompt ===============================
prompt
create or replace procedure interatvi.PRC_IMP_i204(p_iEmpresa in varchar2,
                                         p_iFilial  in varchar2,
                                         p_iDataIni in date,
                                         p_iDataFim in date,
                                         p_tpImposto in varchar2,
                                         p_processo in varchar2,
                                         p_usuario in varchar2) is


  t_i204     i204_outros_doctos%rowtype := null;

  cursor cZXNF is
        -- PIS
        select j.id_outros,
               j.cod_empresa,
               j.cod_estab,
               j.data_oper,
               j.id_empresa,
               j.id_filial,
               imp.id_imposto,
               j.cod_docto,
               j.cod_fis_jur,
               j.num_docto,
               j.serie,
               j.num_lancto,
               j.vlr_oper,
               j.cst,
               j.vlr_base,
               j.vlr_aliq,
               j.vlr_tributo,
               j.discri_oper
         from f100_pis_v j,
              i015_imposto imp
         where 1=1
           and j.imposto       = imp.cod_imposto
           and imp.cod_imposto = p_tpImposto
           and j.id_empresa     = p_iEmpresa
           and j.data_oper     between p_iDataIni
                                   and p_iDataFim
        --
        union all
        -- COFINS
        select j.id_outros,
               j.cod_empresa,
               j.cod_estab,
               j.data_oper,
               j.id_empresa,
               j.id_filial,
               imp.id_imposto,
               j.cod_docto,
               j.cod_fis_jur,
               j.num_docto,
               j.serie,
               j.num_lancto,
               j.vlr_oper,
               j.cst,
               j.vlr_base,
               j.vlr_aliq,
               j.vlr_tributo,
               j.discri_oper
         from f100_cofins_v j,
              i015_imposto imp
         where 1=1
           and j.imposto       = imp.cod_imposto
           and imp.cod_imposto = p_tpImposto
           and j.id_empresa     = p_iEmpresa
           and j.data_oper     between p_iDataIni
                                   and p_iDataFim;

  cursor cZXNF1  is
    select k.ROWID ROWID_ZXNF1
      FROM i204_outros_doctos k,
           i015_imposto imp
     WHERE 1 = 1
       and k.id_imposto    = imp.id_imposto
       and imp.cod_imposto = p_tpImposto
       and k.id_empresa    = p_iEmpresa
       AND k.data_docto between p_iDataIni and p_iDataFim;

  TYPE tpTbRowIdZXNF1 IS TABLE OF ROWID INDEX BY BINARY_INTEGER;

  vtpTbRowIdZXNF1 tpTbRowIdZXNF1;


BEGIN

--===================================================================================================
 --- BEGIN - Limpeza

     open cZXNF1;
            --
            loop
              fetch cZXNF1 bulk collect
                into vtpTbRowIdZXNF1 limit 2000;

              if vtpTbRowIdZXNF1.count > 0 then
                --
                forall vnContador in 1 .. vtpTbRowIdZXNF1.count
                --
                  delete from i204_outros_doctos
                   where rowid = vtpTbRowIdZXNF1(vnContador);
                commit; -- commit a cada 2.000 registros
                --
              end if;

              exit when cZXNF1%notfound;
              --
            end loop;
            --
      close cZXNF1;
   -- END - Limpeza
--===================================================================================================

     for mreg in cZXNF loop

      t_i204.id_docto      := mreg.id_outros;
      t_i204.data_docto    := mreg.data_oper;
      t_i204.tipo_docto    := mreg.cod_docto;
      t_i204.id_empresa    := mreg.id_empresa;
      t_i204.id_filial     := mreg.id_filial;
      t_i204.id_imposto    := mreg.id_imposto;
      t_i204.num_docto     := mreg.num_docto;
      t_i204.serie_docto   := mreg.serie;
      t_i204.num_lancto    := mreg.num_lancto;
      t_i204.vlr_operacao  := mreg.vlr_oper;
      t_i204.cst           := mreg.cst;
      t_i204.vlr_base      := mreg.vlr_base;
      t_i204.vlr_alilquota := mreg.vlr_aliq;
      t_i204.vlr_tributo   := mreg.vlr_tributo;
      t_i204.descricao     := substr(trim(mreg.discri_oper), 1, 50);

      begin

        insert into /*+ append */  i204_outros_doctos values t_i204;

         exception
           when dup_val_on_index then
                PRC_iLOG(p_processo, 'ID DUPLICADO ' || mreg.id_outros, 'PRC_IMP_i204',  sqlerrm, p_usuario);
    --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
           when others then
              PRC_iLOG(p_processo, 'ERRO NO INSERT', 'PRC_IMP_i204',  sqlerrm, p_usuario);
         end;

   end loop;

   commit;

end;
/

prompt
prompt Creating procedure PRC_IMP_I210
prompt ===============================
prompt
create or replace procedure interatvi.PRC_IMP_i210(p_iEmpresa in varchar2,
                                         p_iFilial  in varchar2,
                                         p_iDataIni in date,
                                         p_iDataFim in date,
                                         p_tpImposto in varchar2,
                                         p_processo in varchar2,
                                         p_usuario in varchar2) is


  t_i210     i210_retencoes%rowtype := null;

  cursor cZXNF is
        select distinct i016.id_imposto,
                         (x2005.cod_docto || x53.cod_empresa || x53.cod_estab ||
                             to_char(x53.data_fator_gerador, 'YYYYMMDD') || darf.cod_darf ||
                             x53.num_docfis || x53.serie_docfis || x53.sub_serie_docfis ||
                             x4.ind_fis_jur || x4.cod_fis_jur) ID_DOCTO,
                        x53.cod_empresa,
                        x53.cod_estab,
                        fil.id_empresa,
                        fil.id_filial,
                        x53.num_docfis,
                        x53.serie_docfis,
                        x53.data_movto,
                        x53.data_fator_gerador,
                        darf.cod_darf,
                        to_char(x53.ano_competencia) ano_competencia,
                        to_char(x53.mes_competencia) mes_competencia,
                        x2005.cod_docto,
                        x2005.descricao        desc_docto,
                        x53.cod_ctrl_int       num_lancamento,
                        x53.num_ref,
                        x4.cod_fis_jur,
                        x4.cpf_cgc,
                        x4.razao_social,
                        x4.insc_estadual,
                        x53.vlr_bruto,
                        x53.aliquota,
                        x53.vlr_ir_retido
          from x53_retencao_irrf  x53,
               estabelecimento    estab,
               i005_filial             fil,
               x2005_tipo_docto   x2005,
               x04_pessoa_fis_jur x4,
               x2019_cod_darf     darf,
               i016_cod_darf      i016,
               i015_imposto       imp
         where 1 = 1
           and x53.cod_empresa   = estab.cod_empresa
           and x53.cod_estab     = estab.cod_estab
           and estab.cgc         = fil.cnpj
           and x53.ident_docto   = x2005.ident_docto
           and x53.ident_fis_jur = x4.ident_fis_jur
           and x53.ident_darf    = darf.ident_darf
           and i016.id_imposto   = imp.id_imposto
           and imp.cod_imposto   = p_tpImposto
           and i016.cod_darf     = darf.cod_darf
           and fil.id_empresa     = p_iEmpresa
           and x53.data_fator_gerador
                                between p_iDataIni
                                    and p_iDataFim
        --
        union all
        -- PIS ATIVO
        select distinct i016.id_imposto,
                         ('X145' || x145.cod_empresa || x145.cod_estab ||
                             to_char(x145.data_rec_ret, 'YYYYMMDD') || x145.cod_receita) ID_DOCTO,
                        x145.cod_empresa,
                        x145.cod_estab,
                        fil.id_empresa,
                        fil.id_filial,
                        null num_docfis,
                        null serie_docfis,
                        x145.data_rec_ret data_movto,
                        x145.data_rec_ret data_fator_gerador,
                        x145.cod_receita cod_darf,
                        to_char(x145.data_rec_ret, 'YYYY') ano_competencia,
                        to_char(x145.data_rec_ret, 'MM') mes_competencia,
                        'X145'                  cod_docto,
                        'ATIVO'                 desc_docto,
                        null                    num_lancamento,
                        null                    num_ref,
                        null                    cod_fis_jur,
                        null                    cpf_cgc,
                        null                    razao_social,
                        null                    insc_estadual,
                        x145.vlr_recebido       vlr_bruto,
                        null                    aliquota,
                        x145.vlr_ret_fonte_pis  vlr_retido
          from x145_contrib_ret_fonte  x145,
               estabelecimento    estab,
               i005_filial             fil,
               i016_cod_darf           i016,
               i015_imposto      imp
         where 1 = 1
           and x145.cod_empresa   = estab.cod_empresa
           and x145.cod_estab     = estab.cod_estab
           and estab.cgc         = fil.cnpj
           and i016.id_imposto   = imp.id_imposto
           and imp.cod_imposto   = p_tpImposto
           and i016.cod_darf     = x145.cod_receita
           and x145.vlr_ret_fonte_pis > 0
           and fil.id_empresa     = p_iEmpresa
           and x145.data_rec_ret
                                between p_iDataIni
                                    and p_iDataFim
          --
          union all
          -- COFINS - ATIVO
        select distinct i016.id_imposto,
                         ('X145' || x145.cod_empresa || x145.cod_estab ||
                             to_char(x145.data_rec_ret, 'YYYYMMDD') || x145.cod_receita) ID_DOCTO,
                        x145.cod_empresa,
                        x145.cod_estab,
                        fil.id_empresa,
                        fil.id_filial,
                        null num_docfis,
                        null serie_docfis,
                        x145.data_rec_ret data_movto,
                        x145.data_rec_ret data_fator_gerador,
                        x145.cod_receita cod_darf,
                        to_char(x145.data_rec_ret, 'YYYY') ano_competencia,
                        to_char(x145.data_rec_ret, 'MM') mes_competencia,
                        'X145',
                        'ATIVO'                 desc_docto,
                        null                    num_lancamento,
                        null                    num_ref,
                        null                    cod_fis_jur,
                        null                    cpf_cgc,
                        null                    razao_social,
                        null                    insc_estadual,
                        x145.vlr_recebido       vlr_bruto,
                        null                    aliquota,
                        x145.vlr_ret_fonte_cofins  vlr_retido
          from x145_contrib_ret_fonte  x145,
               estabelecimento    estab,
               i005_filial             fil,
               i016_cod_darf           i016,
               i015_imposto      imp
         where 1 = 1
           and x145.cod_empresa   = estab.cod_empresa
           and x145.cod_estab     = estab.cod_estab
           and estab.cgc         = fil.cnpj
           and i016.id_imposto   = imp.id_imposto
           and imp.cod_imposto   = p_tpImposto
           and i016.cod_darf     = x145.cod_receita
           and x145.vlr_ret_fonte_cofins > 0
           and fil.id_empresa     = p_iEmpresa
           and x145.data_rec_ret
                                between p_iDataIni
                                    and p_iDataFim                                       ;

  cursor cZXNF1  is
    select k.ROWID ROWID_ZXNF1
      FROM i210_retencoes k,
           i016_cod_darf  l,
           i015_imposto   imp
     WHERE 1 = 1
       and k.cod_darf   = l.cod_darf
       and l.id_imposto = imp.id_imposto
       and imp.cod_imposto = p_tpImposto
       and k.id_empresa = p_iEmpresa
       AND k.data_fato_gerador between p_iDataIni and p_iDataFim;

  TYPE tpTbRowIdZXNF1 IS TABLE OF ROWID INDEX BY BINARY_INTEGER;

  vtpTbRowIdZXNF1 tpTbRowIdZXNF1;


BEGIN

--===================================================================================================
 --- BEGIN - Limpeza

     open cZXNF1;
            --
            loop
              fetch cZXNF1 bulk collect
                into vtpTbRowIdZXNF1 limit 2000;

              if vtpTbRowIdZXNF1.count > 0 then
                --
                forall vnContador in 1 .. vtpTbRowIdZXNF1.count
                --
                  delete from i210_retencoes
                   where rowid = vtpTbRowIdZXNF1(vnContador);
                commit; -- commit a cada 2.000 registros
                --
              end if;

              exit when cZXNF1%notfound;
              --
            end loop;
            --
      close cZXNF1;
   -- END - Limpeza
--===================================================================================================

     for mreg in cZXNF loop

       t_i210.id_docto          := mreg.id_docto;
       t_i210.id_empresa        := mreg.id_empresa;
       t_i210.id_filial         := mreg.id_filial;
       t_i210.cod_darf          := mreg.cod_darf;
       t_i210.data_fato_gerador := mreg.data_fator_gerador;
       t_i210.docnum            := mreg.num_ref;
       t_i210.movto             := '1';
       t_i210.num_docto         := mreg.num_docfis;
       t_i210.serie_docto       := mreg.serie_docfis;
       t_i210.data_docto        := mreg.data_movto;
       t_i210.tp_docto           := mreg.cod_docto;
       t_i210.desc_tp_docto      := mreg.desc_docto;
       t_i210.num_lancto        := mreg.num_lancamento;
       t_i210.num_lancto_comp   := null;
       t_i210.cod_parceiro      := mreg.cod_fis_jur;
       t_i210.cnpj_parceiro     := mreg.cpf_cgc;
       t_i210.razao_social      := mreg.razao_social;
       t_i210.insc_estadual     := mreg.insc_estadual;
       t_i210.vlr_docto         := mreg.vlr_bruto;
       t_i210.vlr_aliq          := mreg.aliquota;
       t_i210.vlr_retencao      := mreg.vlr_ir_retido;
       t_i210.ind_docto_manual  := 'N';
       t_i210.aux01             := null;
       t_i210.aux02             := null;
       t_i210.aux03             := null;
       t_i210.aux04             := null;
       t_i210.aux05             := null;
       t_i210.aux06             := null;
       t_i210.ind_integracao    := 'B';


      begin

        insert into /*+ append */  i210_retencoes values t_i210;

         exception
           when dup_val_on_index then
                PRC_iLOG(p_processo, 'ID DUPLICADO ' || mreg.id_docto, 'PRC_IMP_i210',  sqlerrm, p_usuario);
    --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
           when others then
              PRC_iLOG(p_processo, 'ERRO NO INSERT', 'PRC_IMP_i210',  sqlerrm, p_usuario);
         end;

   end loop;

   commit;

end;
/

prompt
prompt Creating procedure PRC_IMP_I220
prompt ===============================
prompt
create or replace procedure interatvi.PRC_IMP_i220(p_iEmpresa in varchar2,
                                         p_iFilial  in varchar2,
                                         p_iDataIni in date,
                                         p_iDataFim in date,
                                         p_tpImposto in varchar2,
                                         p_processo in varchar2,
                                         p_usuario in varchar2) is


  t_i220            i220_lancto_apuracao%rowtype := null;

  cursor cAPUR is
        select j.ID_APUR,
               j.id_filial,
               j.id_empresa,
               j.imposto,
               imp.id_imposto,
               j.cod_tipo_livro,
               j.dat_apuracao,
               j.cod_oper_apur,
               j.dsc_oper_apur,
               j.num_discriminacao,
               j.val_item_discrim,
               j.ind_dig_calculado,
               j.cod_ajuste_icms,
               j.cod_ajuste_ipi,
               j.dsc_item_apuracao
        from apuracao_ajuste_v j,
             i015_imposto    imp
        where 1=1
          and j.imposto    = p_tpImposto
          and j.imposto    = imp.cod_imposto
          and j.id_empresa = p_iEmpresa
          and j.dat_apuracao between p_iDataIni
                                 and p_iDataFim
                                    ;


  cursor cAPUR1  is
    select k.ROWID ROWID_ZXAPUR
      FROM i220_lancto_apuracao k,
           i015_imposto imp
     WHERE 1 = 1
       and k.id_empresa    = p_iEmpresa
       AND k.id_imposto    = imp.id_imposto
       and imp.cod_imposto = p_tpImposto
       AND k.data_apur between p_iDataIni and p_iDataFim;

  TYPE tpTbRowIdZXAPUR IS TABLE OF ROWID INDEX BY BINARY_INTEGER;

  vtpTbRowIdZXAPUR tpTbRowIdZXAPUR;


BEGIN

--===================================================================================================
 --- BEGIN - Limpeza

     open cAPUR1;
            --
            loop
              fetch cAPUR1 bulk collect
                into vtpTbRowIdZXAPUR limit 2000;

              if vtpTbRowIdZXAPUR.count > 0 then
                --
                forall vnContador in 1 .. vtpTbRowIdZXAPUR.count
                --
                  delete from i220_lancto_apuracao
                   where rowid = vtpTbRowIdZXAPUR(vnContador);
                commit; -- commit a cada 2.000 registros
                --
              end if;

              exit when cAPUR1%notfound;
              --
            end loop;
            --
      close cAPUR1;
   -- END - Limpeza
--===================================================================================================

     for mreg in cAPUR loop

      t_i220.id_lancto_apuracao := mreg.id_apur;
      t_i220.id_empresa         := mreg.id_empresa;
      t_i220.id_filial          := mreg.id_filial;
      t_i220.id_imposto         := mreg.id_imposto;
      t_i220.data_apur          := mreg.dat_apuracao;
      t_i220.cod_oper_apur      := mreg.cod_oper_apur;
      t_i220.desc_oper_apur     := substr(mreg.dsc_oper_apur, 1, 50);
      t_i220.sequencial         := mreg.num_discriminacao;
      t_i220.descricao          := substr(mreg.dsc_item_apuracao, 1, 50);
      t_i220.vlr_apur           := mreg.val_item_discrim;
      t_i220.ind_integracao     := 'B';
      t_i220.cod_ajuste         := mreg.cod_ajuste_icms;
      t_i220.cod_livro          := mreg.cod_tipo_livro;

      begin

          insert into /*+ append */  i220_lancto_apuracao values t_i220;
      exception
        when dup_val_on_index then
                PRC_iLOG(p_processo, 'ID DUPLICADO ' || mreg.ID_APUR, 'PRC_IMP_i220',  sqlerrm, p_usuario);
    --              Raise_Application_Error (-20342, 'ID DUPLICADO ' || p_ident_docto || ' - ' || sqlerrm);
        when others then
              PRC_iLOG(p_processo, 'ERRO NO INSERT', 'PRC_IMP_i220',  sqlerrm, p_usuario);
      end;

   end loop;

   commit;

end;
/

prompt
prompt Creating trigger TR_CONCILIATION_DASBOARD
prompt =========================================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.tr_conciliation_dasboard 
BEFORE INSERT ON conciliation_dasboard
FOR EACH ROW

BEGIN
  SELECT seq_conciliation_dasboard.NEXTVAL
  INTO   :new.id_conciliation_dasboard
  FROM   dual;
END;
/

prompt
prompt Creating trigger TR_DASBOARD_VALUE
prompt ==================================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.tr_dasboard_value 
BEFORE INSERT ON dasboard_value
FOR EACH ROW

BEGIN
  SELECT seq_dasboard_value.NEXTVAL
  INTO   :new.id_dasboard_value
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_CATEGORIA
prompt ==============================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_categoria
BEFORE INSERT ON i014_categoria
FOR EACH ROW

BEGIN
  SELECT SEQ_I014_CATEGORIA.NEXTVAL
  INTO   :new.id_categoria
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_CLASS_PEND
prompt ===============================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_class_pend
BEFORE INSERT ON i018_class_pend
FOR EACH ROW

BEGIN
  SELECT SEQ_I018_CLASS_PEND.NEXTVAL
  INTO   :new.id_class
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_CONFIG_INI
prompt ===============================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_config_ini
BEFORE INSERT ON i017_config_ini
FOR EACH ROW

BEGIN
  SELECT SEQ_I017_CONFIG.NEXTVAL
  INTO   :new.id_config
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_EMP_MODULO
prompt ===============================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_emp_modulo
BEFORE INSERT ON i004_empresa_modulo
FOR EACH ROW

BEGIN
  SELECT SEQ_I004_EMP_MODULO.NEXTVAL
  INTO   :new.id_empr_modulo
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_EMPRESA
prompt ============================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_empresa
BEFORE INSERT ON i002_empresa
FOR EACH ROW

BEGIN
  SELECT SEQ_I002_EMPRESA.NEXTVAL
  INTO   :new.id_empresa
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_FILIAL
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_filial
BEFORE INSERT ON i005_filial
FOR EACH ROW

BEGIN
  SELECT SEQ_I005_FILIAL.NEXTVAL
  INTO   :new.id_filial
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_GRUPO_ACESSO
prompt =================================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_grupo_Acesso
BEFORE INSERT ON i006_grupo_acesso
FOR EACH ROW

BEGIN
  SELECT SEQ_I006_GRUPO_ACESSO.NEXTVAL
  INTO   :new.id_grupo_acesso
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_GRUPO_CORP
prompt ===============================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_grupo_corp
BEFORE INSERT ON i001_grupo_corp
FOR EACH ROW

BEGIN
  SELECT SEQ_I001_GRUPO_CORP.NEXTVAL
  INTO   :new.id_grupo_corp
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_IMPOSTO
prompt ============================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_imposto
BEFORE INSERT ON i015_imposto
FOR EACH ROW

BEGIN
  SELECT SEQ_I015_IMPOSTO.NEXTVAL
  INTO   :new.id_imposto
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_MODULO
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_modulo
BEFORE INSERT ON i003_modulo
FOR EACH ROW

BEGIN
  SELECT SEQ_I003_MODULO.NEXTVAL
  INTO   :new.id_modulo
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_MUNICIPIO
prompt ==============================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_municipio
BEFORE INSERT ON i012_municipio
FOR EACH ROW

BEGIN
  SELECT SEQ_I012_MUNICIPIO.NEXTVAL
  INTO   :new.id_municipio
  FROM   dual;
END;
/

prompt
prompt Creating trigger TRG_UF
prompt =======================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.trg_uf
BEFORE INSERT ON i011_uf
FOR EACH ROW

BEGIN
  SELECT SEQ_I011_UF.NEXTVAL
  INTO   :new.id_uf
  FROM   dual;
END;
/

prompt
prompt Creating trigger TR_LAYOUT
prompt ==========================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.tr_layout
BEFORE INSERT ON layout 
FOR EACH ROW

BEGIN
  SELECT seq_layout.NEXTVAL
  INTO   :new.id_layout
  FROM   dual;
END;
/

prompt
prompt Creating trigger TR_LAYOUT_FIELD
prompt ================================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.tr_layout_field
BEFORE INSERT ON layout_field
FOR EACH ROW

BEGIN
  SELECT seq_layout_field.NEXTVAL
  INTO   :new.id_layout_field
  FROM   dual;
END;
/

prompt
prompt Creating trigger TR_LAYOUT_LOG
prompt ==============================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.tr_layout_log
BEFORE INSERT ON layout_log
FOR EACH ROW

BEGIN
  SELECT seq_layout_log.NEXTVAL
  INTO   :new.id_layout_log
  FROM   dual;
END;
/

prompt
prompt Creating trigger TR_USUARIO
prompt ===========================
prompt
CREATE OR REPLACE TRIGGER INTERATVI.tr_usuario 
BEFORE INSERT ON i010_usuario 
FOR EACH ROW

BEGIN
  SELECT seq_i010_usuario.NEXTVAL
  INTO   :new.id_usuario
  FROM   dual;
END;
/


spool off
