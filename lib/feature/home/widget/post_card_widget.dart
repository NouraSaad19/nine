import 'package:flutter/material.dart';
import 'package:flutter_template/core/constant/app_image.dart';
import 'package:flutter_template/core/theme/app_colors.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Card(
          elevation: 0.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Container(
            width: 358,
            height: 194,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.72, -0.70),
                end: const Alignment(-0.72, 0.7),
                colors: [
                  AppColor.logoShadowWhiteColor,
                  AppColor.logoShadowCreamColor
                ],
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 0.50, color: AppColor.logoShadowCloudColor),
                borderRadius: BorderRadius.circular(20),
              ),
              shadows: [
                BoxShadow(
                  color: AppColor.logoGreyColor,
                  blurRadius: 24,
                  offset: const Offset(10, 10),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: AppColor.logoSnowColor,
                  blurRadius: 20,
                  offset: const Offset(-12, -12),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Row(children: [
                  Container(width: 16),
                  SizedBox(
                    width: 44,
                    height: 42,
                    child: Image.asset(AppImage.personImage),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    height: 23,
                    child: Text('Aleen ',
                        textAlign: TextAlign.left,
                        style: textTheme.labelMedium),
                  )
                ]),
                Row(children: [
                  SizedBox(
                    width: 326,
                    height: 86,
                    child: Text(
                      'اهلا في رمضان ... شهر العبادة و الصيام',
                      style: textTheme.bodyMedium,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ]),
                Row(
                  children: [
                    const SizedBox(
                      width: 19,
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: const Alignment(0.72, -0.70),
                          end: const Alignment(-0.72, 0.7),
                          colors: [
                            AppColor.logoShadowWhiteColor,
                            AppColor.logoShadowCreamColor
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 0.50,
                              color: AppColor.logoShadowCloudColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadows: [
                          BoxShadow(
                            color: AppColor.logoGreyColor,
                            blurRadius: 20,
                            offset: const Offset(6, 6),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: AppColor.logoGreyColor,
                            blurRadius: 20,
                            offset: const Offset(-6, -6),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 24.0,
                          ),
                          color: AppColor.tiffanyColor,
                          highlightColor: AppColor.whiteColor),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: const Alignment(0.72, -0.70),
                          end: const Alignment(-0.72, 0.7),
                          colors: [
                            AppColor.logoShadowWhiteColor,
                            AppColor.logoShadowCreamColor
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 0.50,
                              color: AppColor.logoShadowCloudColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadows: [
                          BoxShadow(
                            color: AppColor.logoGreyColor,
                            blurRadius: 20,
                            offset: const Offset(6, 6),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: AppColor.logoGreyColor,
                            blurRadius: 20,
                            offset: const Offset(-6, -6),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.mode_comment_outlined,
                            color: AppColor.tiffanyColor,
                            size: 24.0,
                          ),
                          color: AppColor.tiffanyColor,
                          highlightColor: AppColor.whiteColor),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
