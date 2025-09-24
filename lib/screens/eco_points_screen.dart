import 'package:flutter/material.dart';
import 'package:travel_tracker/l10n/app_localizations.dart';
import 'package:travel_tracker/utils/constants.dart';

class EcoPointsScreen extends StatefulWidget {
  @override
  _EcoPointsScreenState createState() => _EcoPointsScreenState();
}

class _EcoPointsScreenState extends State<EcoPointsScreen> {
  final int totalPoints = 1250;
  final int level = 3;
  final String levelName = "Eco Warrior";

  final List<Map<String, dynamic>> availableRewards = [
    {'name': 'Amazon Voucher', 'points': 1000, 'icon': Icons.card_giftcard},
    {'name': 'Starbucks Coffee', 'points': 200, 'icon': Icons.coffee},
    {'name': 'Movie Tickets', 'points': 500, 'icon': Icons.movie},
    {'name': 'Book Store', 'points': 300, 'icon': Icons.book},
  ];

  final List<Map<String, dynamic>> redeemedRewards = [
    {'name': 'Coffee Voucher', 'points': 200, 'date': 'Jan 15, 2024', 'icon': Icons.local_cafe},
    {'name': 'Eco Bag', 'points': 150, 'date': 'Jan 10, 2024', 'icon': Icons.shopping_bag},
  ];

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Text(loc.ecoPointsTitle),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: kPrimaryColor,
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.eco), text: loc.pointsTab),
              Tab(icon: Icon(Icons.card_giftcard), text: loc.rewardsTab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildPointsTab(loc),
            _buildRewardsTab(loc),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsTab(AppLocalizations loc) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          // Points Card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kPrimaryColor, kPrimaryColor.withOpacity(0.8)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withOpacity(0.3),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  loc.totalEcoPoints,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  totalPoints.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                LinearProgressIndicator(
                  value: (totalPoints % 1000) / 1000,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
                SizedBox(height: 10),
                Text(
                  loc.pointsToNextLevel((1000 - (totalPoints % 1000)).toString()),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),

          // Level Card
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.emoji_events, size: 30, color: Colors.amber),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        levelName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        loc.levelLabel(level.toString()),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
          ),
          SizedBox(height: 30),

          // Badges Section
          Text(
            loc.achievementsBadges,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: [
              _buildBadge(loc.ecoStarter, Icons.eco, true),
              _buildBadge(loc.busCommuter, Icons.directions_bus, true),
              _buildBadge(loc.bikeEnthusiast, Icons.pedal_bike, false),
              _buildBadge(loc.weeklyGoal, Icons.emoji_events, true),
              _buildBadge(loc.monthlyGoal, Icons.star, true),
              _buildBadge(loc.carbonSaver, Icons.forest, true),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildRewardsTab(AppLocalizations loc) {
    return Column(
      children: [
        // Available Rewards Header
        Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Row(
            children: [
              Icon(Icons.card_giftcard, color: kPrimaryColor),
              SizedBox(width: 10),
              Text(
                loc.availableRewards,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                loc.rewardsCount(availableRewards.length.toString()),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        // Available Rewards Grid
        Container(
          height: 220,
          child: GridView.builder(
            padding: EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.85,
            ),
            itemCount: availableRewards.length,
            itemBuilder: (context, index) {
              final reward = availableRewards[index];
              return _buildRewardCard(reward, false, loc);
            },
          ),
        ),

        // Redeemed Rewards Header
        Container(
          padding: EdgeInsets.all(20),
          color: Colors.grey[100],
          child: Row(
            children: [
              Icon(Icons.history, color: Colors.grey[600]),
              SizedBox(width: 10),
              Text(
                loc.redeemedRewards,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              Spacer(),
              Text(
                loc.itemsCount(redeemedRewards.length.toString()),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: redeemedRewards.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history_toggle_off, size: 50, color: Colors.grey[300]),
                      SizedBox(height: 10),
                      Text(
                        loc.noRedeemedRewards,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(15),
                  itemCount: redeemedRewards.length,
                  itemBuilder: (context, index) {
                    final reward = redeemedRewards[index];
                    return _buildRedeemedRewardCard(reward, loc);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildRewardCard(Map<String, dynamic> reward, bool isRedeemed, AppLocalizations loc) {
    bool canRedeem = totalPoints >= reward['points'];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Center(
              child: Icon(reward['icon'], size: 40, color: kPrimaryColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reward['name'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.eco, size: 14, color: kPrimaryColor),
                    SizedBox(width: 5),
                    Text(
                      '${reward['points']} pts',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: canRedeem ? () => _redeemReward(reward, loc) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: canRedeem ? kPrimaryColor : Colors.grey[400],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Text(
                      canRedeem
                          ? loc.redeem
                          : loc.needMorePoints((reward['points'] - totalPoints).toString()),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRedeemedRewardCard(Map<String, dynamic> reward, AppLocalizations loc) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, color: Colors.green, size: 20),
        ),
        title: Text(
          reward['name'],
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'Redeemed on ${reward['date']}',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '-${reward['points']}',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              'points',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _redeemReward(Map<String, dynamic> reward, AppLocalizations loc) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.card_giftcard, size: 40, color: kPrimaryColor),
              ),
              SizedBox(height: 20),
              Text(
                loc.redeemRewardTitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                loc.redeemRewardDescription(reward['name'], reward['points'].toString()),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(loc.cancel),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('🎉 ${loc.redeemSuccess(reward['name'])}'),
                            backgroundColor: kPrimaryColor,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(loc.redeemConfirm),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String title, IconData icon, bool achieved) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: achieved ? kPrimaryColor : Colors.grey[300],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: achieved ? kPrimaryColor.withOpacity(0.3) : Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Icon(icon, color: achieved ? Colors.white : Colors.grey[500], size: 25),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            fontWeight: achieved ? FontWeight.w600 : FontWeight.normal,
            color: achieved ? kPrimaryColor : Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
