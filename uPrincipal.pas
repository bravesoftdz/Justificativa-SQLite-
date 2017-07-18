unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, PngBitBtn, Vcl.Imaging.pngimage, Vcl.Grids,
  Vcl.DBGrids, uADStanIntf, uADStanOption, uADStanParam, uADStanError,
  uADDatSManager, uADPhysIntf, uADDAptIntf, uADStanAsync, uADDAptManager,
  ppDB, ppDBPipe, ppParameter, ppDesignLayer, ppBands, ppStrtch, ppMemo,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  Data.DB, uADCompDataSet, uADCompClient, Vcl.DBCtrls, PngSpeedButton, System.IniFiles,
  System.DateUtils, Vcl.ExtDlgs, Vcl.ImgList, Vcl.Themes, Vcl.Styles;

type
  TParametros = class

  private

    FFuncionario: Integer;
    FNomeArquivo, FJustificativa: String;
    FData: TDate;
    FSaida, FRetorno: TTime;
    FMotivo: Integer;
    FSetor: String;
    FCodSetor: Integer;
    FCaminhoImagem: String;
    FTema: String;
  public

    constructor Create;

  published

    property NomeArquivo: String   read FNomeArquivo   write FNomeArquivo;
    property Funcionario: Integer  read FFuncionario   write FFuncionario;
    property Justificativa: String read FJustificativa write FJustificativa;
    property Data: TDate           read FData          write FData;
    property Setor: String         read FSetor         write FSetor;
    property Motivo: Integer       read FMotivo        write FMotivo;
    property Saida: TTime          read FSaida         write FSaida;
    property Retorno: TTime        read FRetorno       write FRetorno;
    property CodSetor: Integer     read FCodSetor      write FCodSetor;
    property CaminhoImagem: String read FCaminhoImagem write FCaminhoImagem;
    property Tema: String          read FTema          write FTema;

  end;
  TfrmPrincipal = class(TForm)
    pnlBotoesLateral: TPanel;
    btnSair: TPngBitBtn;
    btnJustificativas: TPngBitBtn;
    pnlTela: TPanel;
    pcPrincipal: TPageControl;
    tbInicio: TTabSheet;
    tbJustificativa: TTabSheet;
    imgInicio: TImage;
    pcJustificativa: TPageControl;
    tbHistorico: TTabSheet;
    tbDadosJustificativa: TTabSheet;
    pnlBotoesCima: TPanel;
    grdJustificativas: TDBGrid;
    btnGravar: TPngBitBtn;
    btnCancelar: TPngBitBtn;
    btnDuplicar: TPngBitBtn;
    btnVisualisarImpressao: TPngBitBtn;
    btnImprimir: TPngBitBtn;
    btnSalvarPDF: TPngBitBtn;
    qryHistorico: TADQuery;
    qryHistoricoid: TADAutoIncField;
    qryHistoricofuncionario: TStringField;
    qryHistoricosetor: TStringField;
    qryHistoricodata_saida: TStringField;
    qryHistoricodata_retorno: TStringField;
    qryHistoricomotivo: TStringField;
    qryHistoricojustificativa: TMemoField;
    qryHistoricodata_geracao: TStringField;
    qryHistoricocod_motivo: TIntegerField;
    dsHistorico: TDataSource;
    pprJustificativa: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel6: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel7: TppLabel;
    pplblAtrasoFixo: TppLabel;
    pplblAusenciaTempFixo: TppLabel;
    pplblAusenciaRegistroPFixo: TppLabel;
    pplblFaltaFixo: TppLabel;
    ppLine13: TppLine;
    pplblAtraso: TppLabel;
    pplblAusenciaTemp: TppLabel;
    pplblAusenciaRegistroP: TppLabel;
    pplblFalta: TppLabel;
    pplblHorarioDif: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    pplblData: TppLabel;
    pplblTempo: TppLabel;
    pplblHorarioDifFixo: TppLabel;
    pplblAtestado: TppLabel;
    shpTitulo: TppShape;
    lblTitulo: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    dbpHistorico: TppDBPipeline;
    btnInicio: TPngBitBtn;
    btnNovo: TPngBitBtn;
    btnFechar: TPngBitBtn;
    pnlAbaJustificativa: TPanel;
    gbDadosFunc: TGroupBox;
    lblFuncion�rio: TLabel;
    lblSetor: TLabel;
    btnAddFunc: TPngSpeedButton;
    dblkpFuncionario: TDBLookupComboBox;
    gbPeriodo: TGroupBox;
    lblData: TLabel;
    lblTempo: TLabel;
    lblHoraSaida: TLabel;
    lblHoraRetorno: TLabel;
    dtData: TDateTimePicker;
    dtHoraSaida: TDateTimePicker;
    dtHoraRetorno: TDateTimePicker;
    edtTempo: TEdit;
    rgMotivo: TRadioGroup;
    gbJustificativa: TGroupBox;
    memoJustificativa: TMemo;
    edtSetor: TEdit;
    qryFuncionario: TADQuery;
    qryFuncionarioid: TADAutoIncField;
    qryFuncionarioid_setor: TIntegerField;
    qryFuncionarionome: TStringField;
    dsFuncionario: TDataSource;
    qrySetor: TADQuery;
    qrySetorid: TADAutoIncField;
    qrySetordescricao: TStringField;
    dsSetor: TDataSource;
    qryFuncionarioid_1: TIntegerField;
    qryFuncionariodescricao: TStringField;
    qryGravar: TADQuery;
    WideStringField1: TWideStringField;
    qryIdTexto: TADQuery;
    qryIdTextoseq: TLargeintField;
    sdSalvarPDF: TSaveDialog;
    qryHistoricoCodFuncionario: TIntegerField;
    qryHistoricoCodSetor: TIntegerField;
    btnPatelaDeViagem: TPngBitBtn;
    tbPaletaViagem: TTabSheet;
    pnlDetalheJustificativa: TPanel;
    memoDetalheJustificativa: TMemo;
    btnConfiguracoes: TPngBitBtn;
    tbConfiguracoes: TTabSheet;
    pnlConfiguracoes: TPanel;
    GroupBox1: TGroupBox;
    opdImagemFundo: TOpenPictureDialog;
    imgListImagem: TImageList;
    gbTemas: TGroupBox;
    cbbTemas: TComboBox;
    edtImagemFundo: TEdit;
    btnLozalizarImagem: TPngSpeedButton;
    Panel1: TPanel;
    btnConfirmarConfig: TPngBitBtn;
    btnFecharConfiguracoes: TPngBitBtn;
    qryHistoricoENTREGUE: TStringField;
    btnEntregar: TPngBitBtn;
    qryEntregarJustificativa: TADQuery;
    imgListGrid: TImageList;
    qryHistoricoEntregueGrid: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnJustificativasClick(Sender: TObject);
    procedure btnInicioClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAddFuncClick(Sender: TObject);
    procedure dblkpFuncionarioCloseUp(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbpHistoricoFirst(Sender: TObject);
    procedure dbpHistoricoNext(Sender: TObject);
    procedure btnVisualisarImpressaoClick(Sender: TObject);
    procedure btnSalvarPDFClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
    procedure dtHoraRetornoChange(Sender: TObject);
    procedure btnPatelaDeViagemClick(Sender: TObject);
    procedure qryHistoricoAfterScroll(DataSet: TDataSet);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtImagemFundoRightButtonClick(Sender: TObject);
    procedure btnLozalizarImagemClick(Sender: TObject);
    procedure btnConfirmarConfigClick(Sender: TObject);
    procedure cbbTemasChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnEntregarClick(Sender: TObject);
    procedure grdJustificativasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    FParametros: TParametros;
    FCodSetor: Integer;
    FPosicaoGrid: Integer;

    procedure GravarJustificativa;
    procedure PreencherJustificativa;
    procedure MontarJustificativa(ADeviceType: String);
    procedure TipoImpressao(ADeviceType: String);
    procedure HabilitarBotoesJustificativa(AHabilitar: Boolean);
    procedure GravarParametrosINI(AParametros: TParametros);
    function LerParametrosINI(AParametros: TParametros): Boolean;
    procedure CarregarDados();
    procedure CarregarConfiguracao();
    procedure CarregarComboTemas();
    procedure GravarConfiguracao();

    { Private declarations }
  public
    procedure MostrarTabSheet(AMostrar: Boolean);
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  uDmPrincipal, uAdicionar;

const
  ARQUIVO_PARAMETRO = '.\Justificativa.ini';

procedure TfrmPrincipal.btnAddFuncClick(Sender: TObject);
var
  iCodFuncionario: Integer;
begin

  iCodFuncionario := TfrmAdicionar.InserirNovo;

  if iCodFuncionario > 0 then
  begin

    qryFuncionario.Close;
    qryFuncionario.Open;

    dblkpFuncionario.KeyValue := iCodFuncionario;

    edtSetor.Text := qryFuncionariodescricao.AsString;
    FCodSetor     := qryFuncionarioid_setor.AsInteger;

  end;

end;

procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
begin

  HabilitarBotoesJustificativa(False);

  pcJustificativa.ActivePage := tbHistorico;
end;

procedure TfrmPrincipal.btnConfiguracoesClick(Sender: TObject);
begin

  pcPrincipal.ActivePage := tbConfiguracoes;

end;

procedure TfrmPrincipal.btnConfirmarConfigClick(Sender: TObject);
begin

  if Application.MessageBox(pChar('Aplicar novas configura��es?'),'Confirma��o', MB_ICONQUESTION + MB_YESNO) = mrNo then
    Exit;

  GravarConfiguracao();

  CarregarConfiguracao();

  TStyleManager.TrySetStyle(FParametros.Tema);
  CarregarComboTemas();

end;

procedure TfrmPrincipal.btnDuplicarClick(Sender: TObject);
begin

  if Application.MessageBox(pChar('Confirma Duplicar Justificativa?' + sLineBreak +
                                  '� necess�rio alterar os dados antes de concluir a nova Justificativa.'),'Confirma��o', MB_ICONQUESTION + MB_YESNO) = mrNo then
    Exit;

    FParametros.Funcionario   := qryHistoricoCodFuncionario.AsInteger;
    FParametros.Setor         := qryHistoricosetor.AsString;
    FParametros.Motivo        := qryHistoricocod_motivo.AsInteger;
    FParametros.Justificativa := qryHistoricojustificativa.AsString;
    FParametros.Data          := qryHistoricodata_saida.AsDateTime;
    FParametros.Saida         := qryHistoricodata_saida.AsDateTime;
    FParametros.Retorno       := qryHistoricodata_retorno.AsDateTime;
    FParametros.CodSetor      := qryHistoricoCodSetor.AsInteger;

    qryFuncionario.Close;
    qryFuncionario.Open;

    CarregarDados;

    HabilitarBotoesJustificativa(True);

    pcJustificativa.ActivePage := tbDadosJustificativa;

end;

procedure TfrmPrincipal.btnEntregarClick(Sender: TObject);
begin

  try

    FPosicaoGrid := qryHistorico.RecNo;

    qryEntregarJustificativa.Close;
    qryEntregarJustificativa.ParamByName('justificativa').AsInteger := qryHistoricoid.AsInteger;
    qryEntregarJustificativa.ExecSQL;

    Application.MessageBox(pCHar('Justificativa entregue!'),'Erro', MB_ICONINFORMATION);

    qryHistorico.Close;
    qryHistorico.Open;

    qryHistorico.RecNo := FPosicaoGrid;

  except
    on e:Exception do
      Application.MessageBox(pCHar('Falha ao marcar Justificativa como entregue' + sLineBreak + e.Message),'Erro', MB_ICONERROR);

  end;

end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin

  pcPrincipal.ActivePage := tbInicio;

end;

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin

  if not Application.MessageBox(pChar('Confirma gravar Justificativa?'),'Confirma��o', MB_ICONQUESTION + MB_YESNO) = mrNo then
    Exit;

  try

    try

      FParametros.Funcionario   := dblkpFuncionario.KeyValue;
      FParametros.Setor         := edtSetor.Text;
      FParametros.Data          := dtData.Date;
      FParametros.Motivo        := rgMotivo.ItemIndex;
      FParametros.Justificativa := memoJustificativa.Text;
      FParametros.Saida         := dtHoraSaida.Time;
      FParametros.Retorno       := dtHoraRetorno.Time;
      FParametros.CodSetor      := FCodSetor;

      GravarJustificativa;

      GravarParametrosINI(FParametros);

    except
      on e: Exception do
        Application.MessageBox(PChar('Erro ao gravar Justificativa' + sLineBreak + 'Motivo:'+ sLineBreak + e.Message), 'Erro', MB_ICONERROR);

    end;

  finally

    HabilitarBotoesJustificativa(False);

    qryHistorico.Close;
    qryHistorico.Open;

    pcJustificativa.ActivePage := tbHistorico;

  end;

end;

procedure TfrmPrincipal.btnImprimirClick(Sender: TObject);
begin

  MontarJustificativa('DOC');

end;

procedure TfrmPrincipal.btnInicioClick(Sender: TObject);
begin

  pcPrincipal.ActivePage := tbInicio;

end;

procedure TfrmPrincipal.btnJustificativasClick(Sender: TObject);
begin

  try

    qryHistorico.Close;
    qryHistorico.Open;

    HabilitarBotoesJustificativa(False);

    pcPrincipal.ActivePage     := tbJustificativa;
    pcJustificativa.ActivePage := tbHistorico;
  except
    on e: Exception do
    begin
      if Pos('no such column', e.Message) > 0 then
      begin
        try
          dmPrincipal.ExecutarScripts();
          btnJustificativas.Click;
        except
          on e: Exception do
            Application.MessageBox(PChar('Falha na aplica��o.' + sLineBreak + 'Motivo:'+ sLineBreak + e.Message), 'Erro', MB_ICONERROR);

        end;
      end;

    end;
  end;

end;

procedure TfrmPrincipal.btnNovoClick(Sender: TObject);
begin

  qryFuncionario.Close;
  qryFuncionario.Open;

  if LerParametrosINI(FParametros) then
  begin

    CarregarDados;

  end;

  HabilitarBotoesJustificativa(True);

  pcJustificativa.ActivePage := tbDadosJustificativa;
end;

procedure TfrmPrincipal.btnPatelaDeViagemClick(Sender: TObject);
begin

  pcPrincipal.ActivePage     := tbPaletaViagem;

end;

procedure TfrmPrincipal.CarregarDados;
begin

    dblkpFuncionario.KeyValue := FParametros.Funcionario;
    edtSetor.Text             := FParametros.Setor;
    dtData.Date               := FParametros.Data;
    rgMotivo.ItemIndex        := FParametros.Motivo;
    memoJustificativa.Text    := FParametros.Justificativa;
    dtHoraSaida.Time          := FParametros.Saida;
    dtHoraRetorno.Time        := FParametros.Retorno;
    edtTempo.Text             := IntToStr(MinutesBetween(dtHoraSaida.Time, dtHoraRetorno.Time));
    FCodSetor                 := FParametros.CodSetor;

end;

procedure TfrmPrincipal.CarregarConfiguracao;
var
  FArqIni: TIniFile;
begin

  FArqIni := TIniFile.Create(FParametros.NomeArquivo);
  try

    FParametros.CaminhoImagem := FArqINI.ReadString('Justificativa'  ,'CaminhoImagem' ,'');
    FParametros.Tema          := FArqINI.ReadString('Justificativa'  ,'Tema' ,'Golden Graphite');

    if FParametros.CaminhoImagem <> EmptyStr then
    begin
      imgInicio.Picture.LoadFromFile(FParametros.CaminhoImagem);
      edtImagemFundo.Text := FParametros.CaminhoImagem;
    end;

  finally
    FreeAndNil(FArqIni);
  end;


end;

procedure TfrmPrincipal.cbbTemasChange(Sender: TObject);
begin
  FParametros.Tema := cbbTemas.Items[cbbTemas.ItemIndex];
end;

procedure TfrmPrincipal.CarregarComboTemas;
var
  sTemas: String;
begin

  cbbTemas.Items.BeginUpdate;

  try

    cbbTemas.Items.Clear;

    for sTemas in TStyleManager.StyleNames do
      cbbTemas.Items.Add(sTemas);

    cbbTemas.Sorted := True;
    cbbTemas.ItemIndex := cbbTemas.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  finally
    cbbTemas.Items.EndUpdate;
  end;

end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.btnSalvarPDFClick(Sender: TObject);
begin

  if sdSalvarPDF.Execute(Handle) then
    MontarJustificativa('PDF');

end;

procedure TfrmPrincipal.btnVisualisarImpressaoClick(Sender: TObject);
begin

  MontarJustificativa('Screen');

end;

procedure TfrmPrincipal.edtImagemFundoRightButtonClick(Sender: TObject);
var
  FArqIni: TIniFile;
begin

  FArqIni := TIniFile.Create(FParametros.NomeArquivo);

  if opdImagemFundo.Execute then
  begin

    try

      FParametros.CaminhoImagem := opdImagemFundo.FileName;
      edtImagemFundo.Text := FParametros.CaminhoImagem;


      FArqIni.WriteString('Justificativa', 'CaminhoImagem', FParametros.CaminhoImagem)

    finally
      FreeAndNil(FArqIni);
    end;

    Application.MessageBox('Para que a imagem de fundo seja alterada � necess�rio reiniciar a aplica��o.', 'Informa��o', MB_ICONINFORMATION);

  end;
end;

procedure TfrmPrincipal.MontarJustificativa;
var
  Filtro: TStringList;
begin

  Filtro := TStringList.Create;

  try

    qryHistorico.First;
    while not qryHistorico.Eof do
    begin

      if grdJustificativas.SelectedRows.CurrentRowSelected then
        Filtro.Add(qryHistoricoid.AsString + ',');

      qryHistorico.Next

    end;

    if Filtro.Text <> EmptyStr then
    begin

      qryHistorico.Filter   := 'id in (' + Filtro.Text + ')';
      qryHistorico.Filtered := True;

    end;



    PreencherJustificativa;

    TipoImpressao(ADeviceType);

  finally

    qryHistorico.Filtered := False;

    FreeAndNil(Filtro);

  end;

end;

procedure TfrmPrincipal.TipoImpressao(ADeviceType: String);
begin

  if ADeviceType = 'PDF' then
  begin

    pprJustificativa.DeviceType       := ADeviceType;
    pprJustificativa.AllowPrintToFile := True;
    pprJustificativa.ShowPrintDialog  := False;
    pprJustificativa.TextFileName     := sdSalvarPDF.FileName;
    pprJustificativa.PrintToDevices;
    pprJustificativa.PrintReport;


  end
  else
  begin

    pprJustificativa.AllowPrintToFile := False;
    pprJustificativa.ShowPrintDialog  := True;
    pprJustificativa.DeviceType := ADeviceType;
    pprJustificativa.Print;

  end;

end;

procedure TfrmPrincipal.dblkpFuncionarioCloseUp(Sender: TObject);
begin

  edtSetor.Text := qryFuncionariodescricao.AsString;
  FCodSetor     := qryFuncionarioid_setor.AsInteger;

end;

procedure TfrmPrincipal.dbpHistoricoFirst(Sender: TObject);
begin

  PreencherJustificativa;

end;

procedure TfrmPrincipal.dbpHistoricoNext(Sender: TObject);
begin

  PreencherJustificativa;

end;

procedure TfrmPrincipal.dtHoraRetornoChange(Sender: TObject);
begin
  edtTempo.Text := IntToStr(MinutesBetween(dtHoraSaida.Time, dtHoraRetorno.Time));
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  TStyleManager.TrySetStyle(FParametros.Tema);
  CarregarComboTemas();
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
  function ExtrairResource(ResourceName, ResType, Filename: string): Boolean;
    var
    Resource: TResourceStream;
  begin
    Resource := TResourceStream.create(HInstance, ResourceName, PWideChar(ResType));
    try
      Resource.SaveToFile(Filename);
      result := FileExists(Filename)
    finally
      Resource.Free;
    end;
  end;
var
  ResourceName: string;
begin

  if not FileExists('Anakin.s3db') then
  begin

    ResourceName := ExtractFilePath(ParamStr(0));
    if ResourceName[Length(ResourceName)] <> '\' then
      ResourceName := ResourceName + '\';
    ResourceName := ResourceName + 'Anakin.s3db';

    if not ExtrairResource('Anakin', 's3db', ResourceName) Then
      Application.MessageBox(PChar('Falha ao extrair ' + ResourceName), 'Erro', MB_ICONERROR + MB_OK);

  end;

  FParametros := TParametros.Create;

  btnPatelaDeViagem.Visible := DebugHook <> 0;

  MostrarTabSheet(False);

  pcPrincipal.ActivePage := tbInicio;

end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sRetornoInput: String;
begin

  if pcPrincipal.ActivePage = tbJustificativa then
    if pcJustificativa.ActivePage = tbHistorico then
      if (Key = 80) and (ssCtrl in Shift) then
        btnVisualisarImpressao.Click;

  if (Key = VK_TAB) and (ssCtrl in Shift) and (ssShift in Shift) then
    btnPatelaDeViagem.Visible := UpperCase(InputBox('Solta Hadouken...', '', sRetornoInput)) = 'RYU';

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  CarregarConfiguracao();

end;

procedure TfrmPrincipal.MostrarTabSheet(AMostrar: Boolean);
var
  I: Integer;
begin

  for I := 0 to ComponentCount -1 do
    if Components[I].ClassType = TTabSheet then
      TTabSheet(Components[I]).TabVisible := AMostrar;


end;

procedure TfrmPrincipal.GravarConfiguracao;
var
  FArqIni: TIniFile;
begin
  FArqIni := TIniFile.Create(FParametros.NomeArquivo);

  try

    FArqIni.WriteString('Justificativa', 'CaminhoImagem', FParametros.CaminhoImagem);
    FArqIni.WriteString('Justificativa', 'Tema', FParametros.Tema);

  finally
    FreeAndNil(FArqIni);
  end;

end;

procedure TfrmPrincipal.GravarJustificativa;
begin

  try

    dmPrincipal.Conexao.ExecSQL('insert into justificativa_texto (texto) values (:texto)', [memoJustificativa.Text],[ftString]);

    qryIDTexto.Close;
    qryIDTexto.Open;

    qryGravar.Close;
    qryGravar.ParamByName('ID_FUNCIONARIO').AsInteger            := dblkpFuncionario.KeyValue;
    qryGravar.ParamByName('ID_SETOR').AsInteger                  := FCodSetor;
    qryGravar.ParamByName('ID_MOTIVO').AsInteger                 := rgMotivo.ItemIndex + 1;
    qryGravar.ParamByName('ID_JUSTIFICATIVA_TEXTO').AsInteger    := qryIdTextoseq.AsInteger;
    qryGravar.ParamByName('DATA_GERACAO').AsString               := FormatDateTime('DD/MM/YYYY HH:MM:SS', Now);
    qryGravar.ParamByName('DATA_JUSTIFICATIVA_SAIDA').AsString   := FormatDateTime('DD/MM/YYYY', dtData.DateTime) + ' ' + FormatDateTime('HH:MM:SS', dtHoraSaida.Time);
    qryGravar.ParamByName('DATA_JUSTIFICATIVA_RETORNO').AsString := FormatDateTime('DD/MM/YYYY', dtData.DateTime) + ' ' + FormatDateTime('HH:MM:SS', dtHoraRetorno.Time);
    qryGravar.ExecSQL;

  except
    on e:Exception do
      raise Exception.Create(e.Message);

  end;

end;

procedure TfrmPrincipal.GravarParametrosINI(AParametros: TParametros);
var
  FArqIni: TIniFile;
begin

  FArqIni := TIniFile.Create(AParametros.NomeArquivo);
  try
    FArqIni.WriteInteger('Justificativa' ,'Funcionario' , AParametros.Funcionario);
    FArqIni.WriteInteger('Justificativa' ,'CodSetor'    , AParametros.CodSetor);
    FArqIni.WriteString('Justificativa','Setor'         , AParametros.Setor);
    FArqIni.WriteDate('Justificativa'   ,'Data'         , AParametros.Data);
    FArqIni.WriteInteger('Justificativa','Motivo'       , AParametros.Motivo );
    FArqIni.WriteString('Justificativa' ,'Justificativa', AParametros.Justificativa);
    FArqIni.WriteTime('Justificativa', 'Saida'          , AParametros.Saida);
    FArqIni.WriteTime('Justificativa', 'Retorno'        , AParametros.Retorno);
  finally
    FreeAndNil(FArqIni);
  end;

end;

procedure TfrmPrincipal.grdJustificativasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if Column.FieldName = 'EntregueGrid' then
  begin

    grdJustificativas.Canvas.FillRect(Rect);
    if qryHistoricoENTREGUE.AsString = 'N' then
      imgListGrid.Draw(grdJustificativas.Canvas, Rect.Left + 10, Rect.Top + 1, 0)
    else
      imgListGrid.Draw(grdJustificativas.Canvas, Rect.Left + 10, Rect.Top + 1, 1)

  end;


end;

procedure TfrmPrincipal.HabilitarBotoesJustificativa(AHabilitar: Boolean);
var
  I: Integer;
begin

  btnNovo.Enabled                := not AHabilitar;
  btnGravar.Enabled              := AHabilitar;
  btnCancelar.Enabled            := AHabilitar;
  btnDuplicar.Enabled            := not AHabilitar;
  btnVisualisarImpressao.Enabled := not AHabilitar;
  btnSalvarPDF.Enabled           := not AHabilitar;
  btnImprimir.Enabled            := not AHabilitar;
  btnFechar.Enabled              := not AHabilitar;

  for I := 0 to pnlBotoesLateral.ControlCount -1 do
    if pnlBotoesLateral.Controls[I] is TBitBtn then
      TBitBtn(pnlBotoesLateral.Controls[I]).Enabled := not AHabilitar;




end;

function TfrmPrincipal.LerParametrosINI(AParametros: TParametros): Boolean;
var
  FArqINI : TIniFile;
begin

  FArqIni := TIniFile.Create(AParametros.NomeArquivo);
  try
    AParametros.Funcionario   := FArqINI.ReadInteger('Justificativa' ,'Funcionario'   ,0);
    AParametros.CodSetor      := FArqINI.ReadInteger('Justificativa' ,'CodSetor'      ,0);
    AParametros.Setor         := FArqINI.ReadString('Justificativa'  ,'Setor'          ,'');
    AParametros.Data          := FArqINI.ReadDate('Justificativa'    ,'Data'          ,Now);
    AParametros.Motivo        := FArqINI.ReadInteger('Justificativa' ,'Motivo'        ,-1);
    AParametros.Justificativa := FArqINI.ReadString('Justificativa'  ,'Justificativa' ,'');
    AParametros.Saida         := FArqINI.ReadTime('Justificativa'    ,'Saida'         ,Now);
    AParametros.Retorno       := FArqINI.ReadTime('Justificativa'    ,'Retorno'       ,Now);
  finally
    FreeAndNil(FArqIni);

    Result := (AParametros.Funcionario > 0);
  end;

end;

procedure TfrmPrincipal.btnLozalizarImagemClick(Sender: TObject);
begin

  if opdImagemFundo.Execute then
  begin

    FParametros.CaminhoImagem := opdImagemFundo.FileName;
    edtImagemFundo.Text := FParametros.CaminhoImagem;

  end;
end;

procedure TfrmPrincipal.PreencherJustificativa;
begin

  pplblData.Text                 := FormatDateTime('aaaa DD/MM/YYYY', qryHistoricodata_saida.AsDateTime);
  pplblTempo.Text                := 'Das ' + FormatDateTime('HH:MM', qryHistoricodata_saida.AsDateTime) + ' �s ' + FormatDateTime('HH:MM', qryHistoricodata_retorno.AsDateTime) +
                                    ' Total: ' + FormatDateTime('HH:MM', (qryHistoricodata_saida.AsDateTime - qryHistoricodata_retorno.AsDateTime));

  pplblAtestado.Visible          := qryHistoricocod_motivo.AsInteger = 1;
  pplblAtraso.Visible            := qryHistoricocod_motivo.AsInteger = 2;
  pplblAusenciaTemp.Visible      := qryHistoricocod_motivo.AsInteger = 3;
  pplblAusenciaRegistroP.Visible := qryHistoricocod_motivo.AsInteger = 4;
  pplblFalta.Visible             := qryHistoricocod_motivo.AsInteger = 5;
  pplblHorarioDif.Visible        := qryHistoricocod_motivo.AsInteger = 6;

end;

procedure TfrmPrincipal.qryHistoricoAfterScroll(DataSet: TDataSet);
begin
  memoDetalheJustificativa.Clear;
  memoDetalheJustificativa.Text := qryHistoricojustificativa.AsString;
end;

{ TParametros }

constructor TParametros.Create;
begin

  NomeArquivo   := ARQUIVO_PARAMETRO;
  Funcionario   := 0;
  Justificativa := '';
  Setor         := '';
  Data          := 0;
  Motivo        := 0;
  Saida         := 0;
  Retorno       := 0;

end;

end.
