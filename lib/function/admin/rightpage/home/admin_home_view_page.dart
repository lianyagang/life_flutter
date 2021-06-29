import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Desc:
/// <p>
/// Date: 2021/6/25
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
class AdminHomeViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = (size.width - 500) / 2;

    return SafeArea(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 1,
              ),
            ),
            child: Text(
              '首页',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Container(
            height: 30,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
                child: Text(
                  '今日订单总数',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
                child: Text(
                  '今日销售总额',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
                child: Text(
                  '昨日销售总额',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Container(
            padding: EdgeInsets.all(0),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  height: 50,
                  color: Colors.blueGrey,
                  child: Text(
                    "待处理事务",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                Row(children: [
                  Container(
                    child: Text(
                      '待付款订单',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Container(
                    child: Text(
                      '已完成订单',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Container(
                    child: Text(
                      '待确认收货订单',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                Row(children: [
                  Container(
                    child: Text(
                      '待发货订单',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Container(
                    child: Text(
                      '新缺货登记',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Container(
                    child: Text(
                      '待处理退款申请',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                Row(children: [
                  Container(
                    child: Text(
                      '已发货订单',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Container(
                    child: Text(
                      '待处理退货订单',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Container(
                    child: Text(
                      '广告位即将到期',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
              ],
            ),
          ),
          Container(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.red,
                        child: Text(
                          '商品总览',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Container(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              '已下架',
                              style:
                              TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              '已上架',
                              style:
                              TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              '库存紧张',
                              style:
                              TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              '全部商品',
                              style:
                              TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.grey,
                        child: Text(
                          '用户总览',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Container(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Text(
                              '今日新增',
                              style:
                              TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              '昨日新增',
                              style:
                              TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              '本月新增',
                              style:
                              TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Container(
                            child: Text(
                              '会员总数',
                              style:
                              TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
