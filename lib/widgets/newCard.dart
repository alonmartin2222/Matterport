import 'package:flutter/material.dart';

class NewCard extends StatefulWidget {
  NewCard(
      {required this.title,
      required this.src,
      required this.image,
      required this.gif});

  final String src;
  final String image;
  final String gif;
  final String title;
  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> with AutomaticKeepAliveClientMixin {
  bool ishover = false;

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF546e7a),
                          ),
                          child: IconButton(
                              splashColor: Colors.transparent,
                              disabledColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              color: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              icon: Icon(
                                Icons.close,
                                size: 60,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Center(
                        child: Container(
                          width: size.width - 100,
                          height: size.height - 200,
                          child: HtmlElementView(
                            key: UniqueKey(),
                            viewType: '${widget.src}',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: MouseRegion(
        onEnter: (value) {
          setState(() {
            ishover = !ishover;
          });
        },
        onExit: (value) {
          setState(() {
            ishover = !ishover;
          });
        },
        child: Container(
          width: size.height / 5,
          height: size.height / 20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(ishover ? widget.gif : widget.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(size.height / 40),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // width: size.height / 4,
              height: size.height / 20,
              decoration: BoxDecoration(
                color: Color(0xFF546e7a),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size.height / 40),
                  bottomRight: Radius.circular(size.height / 40),
                ),
              ),
              child: Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height / 50,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
