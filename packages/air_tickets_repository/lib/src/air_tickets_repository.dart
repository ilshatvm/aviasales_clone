import 'package:air_tickets_repository/src/const_paths.dart';
import 'package:air_tickets_repository/src/models/models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'air_tickets_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AirTicketsRepository {
  factory AirTicketsRepository(Dio dio, {String baseUrl}) =
      _AirTicketsRepository;

  @GET(offersPath)
  Future<Offers> getOffers();

  @GET(ticketsOffersPath)
  Future<TicketsOffers> getTicketsOffers();

  @GET(ticketsPath)
  Future<Tickets> getTickets();
}
