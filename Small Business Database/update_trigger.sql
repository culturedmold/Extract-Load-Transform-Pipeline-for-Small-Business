— Trigger on detailed_report to continually update summary_report as data is added to detail_report
CREATE TRIGGER update_summary_report
AFTER INSERT OR UPDATE OR DELETE
ON detail_report
FOR EACH STATEMENT EXECUTE PROCEDURE rentals_by_actor();