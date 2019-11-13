import 'package:flutter/material.dart';
import 'package:frazilegradients/constants/colors.dart';
import 'package:frazilegradients/constants/frazile.dart';
import 'package:frazilegradients/pages/color/colorArguments.dart';
import 'package:frazilegradients/pages/config/configBloc.dart';
import 'package:frazilegradients/services/responses.dart';

class HomeBody extends StatefulWidget {
  final List<GradientData> gradientData;
  HomeBody(this.gradientData);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: ConfigBloc().darkModeOn
            ? FzColors.darkCanvasColor
            : FzColors.canvasColor,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
          itemBuilder: (context, index) => ListTile(
            onTap: () => Navigator.pushNamed(
              context,
              Frazile.colorDetail,
              arguments: ColorArguments(
                widget.gradientData[index].name,
                widget.gradientData[index].colors,
                widget.gradientData[index].stops,
              ),
            ),
            leading: AnimatedContainer(
              width: MediaQuery.of(context).size.width * .14,
              height: MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: FzColors()
                      .getListColors(widget.gradientData[index].colors),
                  tileMode: TileMode.clamp,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: widget.gradientData[index].stops,
                ),
              ),
              duration: Duration(milliseconds: 500),
            ),
            title: Padding(
              padding: Frazile.gradientListTileTitlePadding,
              child: Text(
                widget.gradientData[index].name,
                style: TextStyle(
                  fontSize: Frazile.gradientListTileTitleSize,
                  fontWeight: Frazile.gradientListTileFontWeight,
                  fontFamily: Frazile.gradientListTileFontFamily,
                  letterSpacing: Frazile.gradientListTileTitleLetterSpacing,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
            subtitle: Container(
              width: MediaQuery.of(context).size.width * .20,
              height: MediaQuery.of(context).size.height * .030,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: FzColors()
                      .getListColors(widget.gradientData[index].colors),
                  tileMode: TileMode.clamp,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: widget.gradientData[index].stops,
                ),
              ),
            ),
          ),
          itemCount: widget.gradientData.length,
        ),
      );
}
