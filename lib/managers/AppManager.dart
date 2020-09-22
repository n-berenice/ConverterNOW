import 'package:converterpro/models/Conversions.dart';
import 'package:converterpro/models/Settings.dart';
import 'package:converterpro/pages/SettingsPage.dart';
import 'package:converterpro/utils/Localization.dart';
import 'package:converterpro/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'ConversionManager.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AppManager extends StatefulWidget{
  @override
  _AppManagerState createState() => _AppManagerState();
}

class _AppManagerState extends State<AppManager> {

  static List<Widget> listaDrawer=new List(MAX_CONVERSION_UNITS+1);//+1 perchè c'è l'intestazione
  static List<String> listaTitoli;
  static bool showRateSnackBar = false;
  int _currentPage = 0;
  

  @override
  void initState() {
    //_getOrdersDrawer();
    //_getOrdersUnita();
    //TODO: snackbar
    //bool stopRequestRating = prefs.getBool("stop_request_rating") ?? false;
    //if(numeroVolteAccesso>=5 && !stopRequestRating && getBoolWithProbability(30))
      //showRateSnackBar=true;
    /*SchedulerBinding.instance.addPostFrameCallback((_) {
      _getCurrency();
    });*/
    
      
    super.initState();  
  }

  ///Method needed to change the selected conversion page
  onSelectItem(int index) {
    if(_currentPage!=index){
      setState(() =>_currentPage = index);
    }
  }


  void initializeTiles(){
    Color boxColor=Theme.of(context).primaryColor;

    List<Widget> drawerActions = <Widget>[
      IconButton(
        tooltip: MyLocalizations.of(context).trans('riordina'),
        icon: Icon(Icons.reorder,color: Colors.white,),
        //TODO: to implement 
        //onPressed:() => _changeOrderDrawer(context, MyLocalizations.of(context).trans('mio_ordinamento'))
      ),
      IconButton(
        tooltip: MyLocalizations.of(context).trans('impostazioni'),
        icon:Icon(Icons.settings,color: Colors.white,),
        onPressed: (){
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage(Theme.of(context).primaryColor, Theme.of(context).accentColor)),
          );
        },
      ),
    ];

    bool logoVisibility = context.select<Settings, bool>(
      (settings) => settings.isLogoVisible,
    );

    listaDrawer[0]=
        logoVisibility ? 
          Container(
            decoration: BoxDecoration(color: boxColor/*listaColori[currentPage],*/),
            child:SafeArea(
              child: Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child:Image.asset("resources/images/logo.png"),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(color: boxColor,),),
                  Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: drawerActions
                    ),
                    height: 160.0,
                    alignment: FractionalOffset.bottomRight,
                  )  
                ]
            )
          ))
          :
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor/*listaColori[currentPage],*/),
            child:SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: drawerActions,
              ),
          ));
    
    List<int> conversionsOrderDrawer = context.select<Conversions, List<int>>(
      (conversions) => conversions.conversionsOrderDrawer
    );

    listaDrawer[conversionsOrderDrawer[0]+1]=ListTileConversion(listaTitoli[0],"resources/images/lunghezza.png",_currentPage==0,(){ onSelectItem(0);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[1]+1]=ListTileConversion(listaTitoli[1],"resources/images/area.png",_currentPage==1,(){ onSelectItem(1);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[2]+1]=ListTileConversion(listaTitoli[2],"resources/images/volume.png",_currentPage==2,(){ onSelectItem(2);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[3]+1]=ListTileConversion(listaTitoli[3],"resources/images/tempo.png",_currentPage==3,(){ onSelectItem(3);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[4]+1]=ListTileConversion(listaTitoli[4],"resources/images/temperatura.png",_currentPage==4,(){ onSelectItem(4);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[5]+1]=ListTileConversion(listaTitoli[5],"resources/images/velocita.png",_currentPage==5,(){ onSelectItem(5);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[6]+1]=ListTileConversion(listaTitoli[6],"resources/images/prefissi.png",_currentPage==6,(){ onSelectItem(6);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[7]+1]=ListTileConversion(listaTitoli[7],"resources/images/massa.png",_currentPage==7,(){ onSelectItem(7);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[8]+1]=ListTileConversion(listaTitoli[8],"resources/images/pressione.png",_currentPage==8,(){ onSelectItem(8);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[9]+1]=ListTileConversion(listaTitoli[9],"resources/images/energia.png",_currentPage==9,(){ onSelectItem(9);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[10]+1]=ListTileConversion(listaTitoli[10],"resources/images/angoli.png",_currentPage==10,(){ onSelectItem(10);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[11]+1]=ListTileConversion(listaTitoli[11],"resources/images/valuta.png",_currentPage==11,(){ onSelectItem(11);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[12]+1]=ListTileConversion(listaTitoli[12],"resources/images/scarpe.png",_currentPage==12,(){ onSelectItem(12);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[13]+1]=ListTileConversion(listaTitoli[13],"resources/images/dati.png",_currentPage==13,(){ onSelectItem(13);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[14]+1]=ListTileConversion(listaTitoli[14],"resources/images/potenza.png",_currentPage==14,(){ onSelectItem(14);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[15]+1]=ListTileConversion(listaTitoli[15],"resources/images/forza.png",_currentPage==15,(){ onSelectItem(15);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[16]+1]=ListTileConversion(listaTitoli[16],"resources/images/torque.png",_currentPage==16,(){ onSelectItem(16);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[17]+1]=ListTileConversion(listaTitoli[17],"resources/images/consumo.png",_currentPage==17,(){ onSelectItem(17);Navigator.of(context).pop();});
    listaDrawer[conversionsOrderDrawer[18]+1]=ListTileConversion(listaTitoli[18],"resources/images/conversione_base.png",_currentPage==18,(){ onSelectItem(18);Navigator.of(context).pop();});
    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  }

  @override
  Widget build(BuildContext context) {

    listaTitoli=[MyLocalizations.of(context).trans('lunghezza'),MyLocalizations.of(context).trans('superficie'),MyLocalizations.of(context).trans('volume'),
    MyLocalizations.of(context).trans('tempo'),MyLocalizations.of(context).trans('temperatura'),MyLocalizations.of(context).trans('velocita'),
    MyLocalizations.of(context).trans('prefissi_si'),MyLocalizations.of(context).trans('massa'),MyLocalizations.of(context).trans('pressione'),
    MyLocalizations.of(context).trans('energia'), MyLocalizations.of(context).trans('angoli'),MyLocalizations.of(context).trans('valuta'),
    MyLocalizations.of(context).trans('taglia_scarpe'),MyLocalizations.of(context).trans('dati_digitali'),MyLocalizations.of(context).trans('potenza'),
    MyLocalizations.of(context).trans('forza'), MyLocalizations.of(context).trans('momento'),MyLocalizations.of(context).trans('consumo_carburante'),
    MyLocalizations.of(context).trans('basi_numeriche')];

    initializeTiles();

    /*if(listaConversioni==null)
      return SizedBox();
    */
    DateTime lastUpdateCurrencies = context.select<Conversions, DateTime>(
      (settings) => settings.lastUpdateCurrency,
    );

    String stringLastUpdateCurrencies;
    DateTime dateNow = DateTime.now();
    if(lastUpdateCurrencies.day == dateNow.day && lastUpdateCurrencies.month == dateNow.month && lastUpdateCurrencies.year == dateNow.year)
      stringLastUpdateCurrencies = MyLocalizations.of(context).trans('ultimo_update_valute') + MyLocalizations.of(context).trans('oggi');
    else
      stringLastUpdateCurrencies = MyLocalizations.of(context).trans('ultimo_update_valute') + DateFormat("yyyy-MM-dd").format(lastUpdateCurrencies);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: listaDrawer,
        ),
      ),
      body: Builder(
        builder: (context) => 
        Consumer<Conversions>(
          builder: (context, conversions, _) => ConversionManager(
            () { Scaffold.of(context).openDrawer(); },   //open Drawer
            _currentPage,                              //current page
            onSelectItem,                             //change page
            listaTitoli,
            showRateSnackBar,
            conversions.conversionsList,
            conversions.conversionsOrder,
            stringLastUpdateCurrencies,
            conversions.currencyValues
          ),
        ),
      )
    );
  }
}

