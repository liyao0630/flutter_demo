import 'package:flutter/material.dart';
// import 'package:protect_dev/page/test.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'defalut'),
    Tab(text: 'RIGHT2'),
    Tab(text: 'RIGHT3'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.red,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < 10; i++)
                    Container(
                        width: 58,
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Text('test')),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.blue,
            child: TabBar(
              controller: _tabController,
              tabs: myTabs,
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: myTabs.map((Tab tab) {
              // final String label = tab.text.toLowerCase();
              return SingleChildScrollView(
                  // padding: EdgeInsets.all(10),
                  child: Column(
                children: [
                  Text(
                      '《通知》明确提出，开展专项摸排，建立未就业毕业生实名清单，放开线上线下各类登记服务渠道，对登记毕业生逐一联系，摸清就业需求。同时，要加快岗位落实，加快实施企业吸纳就业补贴政策，加快机关事业单位、国有企业、基层服务项目和科研助理岗位招录（聘）进度，挖掘平台经济、数字经济从业机会，围绕基层治理、教育医疗、农业技术等人才紧缺领域增设岗位。同时，要加快扶持创业创新，对创业毕业生普遍提供针对性创业培训，推荐适合发挥毕业生专长的创业项目，优先安排经营场所，落实创业担保贷款、创业补贴等政策。《通知》明确提出，开展专项摸排，建立未就业毕业生实名清单，放开线上线下各类登记服务渠道，对登记毕业生逐一联系，摸清就业需求。同时，要加快岗位落实，加快实施企业吸纳就业补贴政策，加快机关事业单位、国有企业、基层服务项目和科研助理岗位招录（聘）进度，挖掘平台经济、数字经济从业机会，围绕基层治理、教育医疗、农业技术等人才紧缺领域增设岗位。同时，要加快扶持创业创新，对创业毕业生普遍提供针对性创业培训，推荐适合发挥毕业生专长的创业项目，优先安排经营场所，落实创业担保贷款、创业补贴等政策。《通知》明确提出，开展专项摸排，建立未就业毕业生实名清单，放开线上线下各类登记服务渠道，对登记毕业生逐一联系，摸清就业需求。同时，要加快岗位落实，加快实施企业吸纳就业补贴政策，加快机关事业单位、国有企业、基层服务项目和科研助理岗位招录（聘）进度，挖掘平台经济、数字经济从业机会，围绕基层治理、教育医疗、农业技术等人才紧缺领域增设岗位。同时，要加快扶持创业创新，对创业毕业生普遍提供针对性创业培训，推荐适合发挥毕业生专长的创业项目，优先安排经营场所，落实创业担保贷款、创业补贴等政策。《通知》明确提出，开展专项摸排，建立未就业毕业生实名清单，放开线上线下各类登记服务渠道，对登记毕业生逐一联系，摸清就业需求。同时，要加快岗位落实，加快实施企业吸纳就业补贴政策，加快机关事业单位、国有企业、基层服务项目和科研助理岗位招录（聘）进度，挖掘平台经济、数字经济从业机会，围绕基层治理、教育医疗、农业技术等人才紧缺领域增设岗位。同时，要加快扶持创业创新，对创业毕业生普遍提供针对性创业培训，推荐适合发挥毕业生专长的创业项目，优先安排经营场所，落实创业担保贷款、创业补贴等政策。',
                      style: const TextStyle(fontSize: 16)),
                  IconButton(
                    icon: Icon(Icons.search),
                    tooltip: 'Search',
                    onPressed: () => {Navigator.pushNamed(context, '/content')},
                  )
                ],
              ));
            }).toList(),
          ))
        ],
      ),
    );
  }
}
